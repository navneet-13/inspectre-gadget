import claripy
import itertools
import traceback

def is_sym_expr(x) -> bool:
    return isinstance(x, claripy.ast.base.Base) and x.symbolic

def is_sym_var(x) -> bool:
    return is_sym_expr(x) and x.depth == 1

def get_vars(expr) -> set[claripy.BV]:
    if not is_sym_expr(expr):
        return []

    return set([leaf for leaf in expr.leaf_asts() if is_sym_expr(leaf)])

def get_annotations(expr):
    annos = set()
    for v in get_vars(expr):
        annos.update(v.annotations)

    return annos

def get_arm64_indirect_thunks(proj):
    # aarch64 does not have thunks. Placeholder.
    symbol_names = {}
    ind_calls = {}

    for symbol, reg in symbol_names.items():
        addr = proj.loader.find_symbol(symbol)
        if addr:
            ind_calls[addr.rebased_addr] = reg

    return ind_calls

def get_arm64_registers():
    return  [
        "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9",
        "x10", "x11", "x12", "x13", "x14", "x15", "x16", "x17", "x18",
        "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26", "x27",
        "x28", "x29", "x30", "sp"
    ]

def report_error(error: Exception, where="dunno", start_addr="dunno", error_type="GENERIC"):
    ins_addr = None
    if hasattr(error, 'ins_addr') and isinstance(error.ins_addr, int):
        ins_addr = hex(error.ins_addr)

    o = open("fail.txt", "a+")
    o.write(f"---------------- [ {error_type} ERROR ] ----------------\n")
    o.write(f"where: {where}     started at: {start_addr} {f'instruction addr: {ins_addr}' if ins_addr else ''}\n")
    o.write(str(error) + "\n")
    o.write(traceback.format_exc())
    o.write("\n")
    o.close()

def report_unsupported(error: Exception, where="dunno", start_addr="dunno", error_type="GENERIC"):
    if hasattr(error, 'ins_addr') and isinstance(error.ins_addr, int):
        where = hex(error.ins_addr)

    o = open("unsupported.txt", "a+")
    o.write(f"---------------- [ {error_type} UNSUPPORTED INSTRUCTION ] ----------------\n")
    o.write(f"instruction addr: {where}     started at: {start_addr}\n")
    o.write(str(error) + "\n")
    o.write("\n")
    o.close()

def report_timeout(where="dunno", start_addr="dunno"):
    o = open("timeout.txt", "a+")
    o.write(f"---------------- [ TIMEOUT ] ----------------\n")
    o.write(f"instruction addr: {where}     started at: {start_addr}\n")
    o.close()

def get_outcome(cond, source, target):
    if cond.concrete:
        if cond.is_true():
            return "Taken"
        else:
            return "Not Taken"
    elif target.symbolic:
        return "Indirect JMP"
    else:
        # TODO: this is an approximation, find a better way to
        # understand if the branch was taken or not.
        target_addr = target.concrete_value
        if target_addr == source + 2:
            return "Not Taken"
        else:
            return "Taken"

def branch_outcomes(history):
    outcomes = []
    for cond, source, target in zip(history.jump_guards, history.jump_sources, history.jump_targets):
        outcomes.append(get_outcome(cond, source, target))

    return outcomes

def ordered_branches(branches):
    branches = sorted(branches, key=lambda x: x[0])
    return [(hex(addr), cond, taken) for addr, cond, taken in branches]

def ordered_constraints(constraints):
    constraints = sorted(constraints, key=lambda x: x[0])
    return [(hex(addr), cond, str(ctype)) for addr, cond, ctype in constraints]
