Search.setIndex({"docnames": ["api", "configuration", "experiments", "generated/analyzer", "generated/analyzer.analysis", "generated/analyzer.analysis.baseControlAnalysis", "generated/analyzer.analysis.bitsAnalysis", "generated/analyzer.analysis.branchControlAnalysis", "generated/analyzer.analysis.dependencyGraph", "generated/analyzer.analysis.pathAnalysis", "generated/analyzer.analysis.rangeAnalysis", "generated/analyzer.analysis.range_strategies", "generated/analyzer.analysis.range_strategies.find_constraints_bounds", "generated/analyzer.analysis.range_strategies.find_masking", "generated/analyzer.analysis.range_strategies.infer_isolated", "generated/analyzer.analysis.range_strategies.small_set", "generated/analyzer.analysis.requirementsAnalysis", "generated/analyzer.analysis.tfpAnalysis", "generated/analyzer.analysis.transmissionAnalysis", "generated/analyzer.analyzer", "generated/analyzer.asmprinter", "generated/analyzer.asmprinter.asmprinter", "generated/analyzer.scanner", "generated/analyzer.scanner.annotations", "generated/analyzer.scanner.memory", "generated/analyzer.scanner.scanner", "generated/analyzer.shared", "generated/analyzer.shared.astTransform", "generated/analyzer.shared.config", "generated/analyzer.shared.logger", "generated/analyzer.shared.ranges", "generated/analyzer.shared.taintedFunctionPointer", "generated/analyzer.shared.transmission", "generated/analyzer.shared.utils", "generated/reasoner", "generated/reasoner.reasoner", "index", "internals/analyzer", "internals/index", "internals/reasoner", "introduction", "output", "quickstart"], "filenames": ["api.rst", "configuration.md", "experiments.md", "generated/analyzer.rst", "generated/analyzer.analysis.rst", "generated/analyzer.analysis.baseControlAnalysis.rst", "generated/analyzer.analysis.bitsAnalysis.rst", "generated/analyzer.analysis.branchControlAnalysis.rst", "generated/analyzer.analysis.dependencyGraph.rst", "generated/analyzer.analysis.pathAnalysis.rst", "generated/analyzer.analysis.rangeAnalysis.rst", "generated/analyzer.analysis.range_strategies.rst", "generated/analyzer.analysis.range_strategies.find_constraints_bounds.rst", "generated/analyzer.analysis.range_strategies.find_masking.rst", "generated/analyzer.analysis.range_strategies.infer_isolated.rst", "generated/analyzer.analysis.range_strategies.small_set.rst", "generated/analyzer.analysis.requirementsAnalysis.rst", "generated/analyzer.analysis.tfpAnalysis.rst", "generated/analyzer.analysis.transmissionAnalysis.rst", "generated/analyzer.analyzer.rst", "generated/analyzer.asmprinter.rst", "generated/analyzer.asmprinter.asmprinter.rst", "generated/analyzer.scanner.rst", "generated/analyzer.scanner.annotations.rst", "generated/analyzer.scanner.memory.rst", "generated/analyzer.scanner.scanner.rst", "generated/analyzer.shared.rst", "generated/analyzer.shared.astTransform.rst", "generated/analyzer.shared.config.rst", "generated/analyzer.shared.logger.rst", "generated/analyzer.shared.ranges.rst", "generated/analyzer.shared.taintedFunctionPointer.rst", "generated/analyzer.shared.transmission.rst", "generated/analyzer.shared.utils.rst", "generated/reasoner.rst", "generated/reasoner.reasoner.rst", "index.rst", "internals/analyzer.md", "internals/index.rst", "internals/reasoner.md", "introduction.md", "output.md", "quickstart.md"], "titles": ["API Reference", "Configuration", "Examples", "analyzer", "analyzer.analysis", "analyzer.analysis.baseControlAnalysis", "analyzer.analysis.bitsAnalysis", "analyzer.analysis.branchControlAnalysis", "analyzer.analysis.dependencyGraph", "analyzer.analysis.pathAnalysis", "analyzer.analysis.rangeAnalysis", "analyzer.analysis.range_strategies", "analyzer.analysis.range_strategies.find_constraints_bounds", "analyzer.analysis.range_strategies.find_masking", "analyzer.analysis.range_strategies.infer_isolated", "analyzer.analysis.range_strategies.small_set", "analyzer.analysis.requirementsAnalysis", "analyzer.analysis.tfpAnalysis", "analyzer.analysis.transmissionAnalysis", "analyzer.analyzer", "analyzer.asmprinter", "analyzer.asmprinter.asmprinter", "analyzer.scanner", "analyzer.scanner.annotations", "analyzer.scanner.memory", "analyzer.scanner.scanner", "analyzer.shared", "analyzer.shared.astTransform", "analyzer.shared.config", "analyzer.shared.logger", "analyzer.shared.ranges", "analyzer.shared.taintedFunctionPointer", "analyzer.shared.transmission", "analyzer.shared.utils", "reasoner", "reasoner.reasoner", "Welcome to InSpectre Gadget\u2019s documentation!", "Analyzer", "Internals", "Reasoner", "Introduction", "Output", "Getting Started"], "terms": {"A": [1, 37, 40, 42], "yaml": [1, 42], "file": [1, 20, 42], "must": 1, "provid": [1, 2, 36, 41, 42], "tool": [1, 36, 40, 41, 42], "config": [1, 42], "flag": [1, 42], "The": [1, 2, 8, 19, 25, 37, 41, 42], "defin": 1, "which": [1, 9, 16, 37, 41], "regist": [1, 16, 37, 40, 41], "stack": [1, 40], "locat": [1, 16, 37, 40, 41], "ar": [1, 4, 6, 8, 27, 37, 40, 41, 42], "control": [1, 5, 16, 37, 40, 41], "user": [1, 42], "well": [1, 36], "some": [1, 2, 36, 41, 42], "analysi": [1, 19, 27, 36, 37, 40], "paramet": 1, "here": 1, "": [1, 27, 37, 41], "an": [1, 37, 40, 42], "exampl": [1, 36, 41, 42], "attack": [1, 16, 37, 40, 41], "note": [1, 36, 37], "we": [1, 2, 37, 40, 41], "gener": [1, 40, 41], "consid": [1, 8, 37, 40, 41], "everyth": [1, 37], "later": [1, 40, 41], "filter": [1, 40], "gadget": [1, 2, 4, 19, 20, 31, 37, 40, 41, 42], "base": [1, 5, 18, 37, 40, 41], "requir": [1, 37, 40, 41, 42], "column": [1, 36], "controlled_regist": 1, "rax": [1, 37, 41], "rbx": [1, 37], "argument": [1, 37], "rdi": 1, "rsi": 1, "rdx": 1, "rcx": 1, "r8": 1, "r9": 1, "purpos": 1, "r10": 1, "r11": 1, "r12": 1, "r13": 1, "r14": 1, "r15": 1, "what": [1, 37, 41], "portion": 1, "i": [1, 5, 7, 8, 9, 18, 19, 24, 25, 36, 37, 40, 41, 42], "controlled_stack": 1, "20": 1, "64": 1, "bit": [1, 6], "valu": [1, 37, 41], "start": [1, 36], "0": [1, 37], "end": [1, 37], "160": 1, "size": [1, 42], "8": 1, "verbos": 1, "log": 1, "output": [1, 2, 19, 36, 40, 42], "level": [1, 36], "1": [1, 19, 37, 41], "coars": 1, "grain": 1, "2": [1, 19, 37], "fine": 1, "debug": 1, "loglevel": 1, "forward": 1, "store": [1, 25, 37], "subsequ": 1, "load": [1, 19, 25, 37, 40, 41], "stlforward": 1, "true": 1, "timeout": 1, "z3": 1, "solver": 1, "when": [1, 41], "evalu": [1, 42], "constraint": [1, 7, 8, 37, 41], "z3timeout": 1, "10000": 1, "m": 1, "10": 1, "maximum": 1, "number": [1, 37], "basic": [1, 18, 24, 36, 37, 40, 42], "block": [1, 37, 40], "explor": [1, 40], "each": [1, 8, 19, 37, 40, 41, 42], "entrypoint": [1, 19, 40, 42], "maxbb": 1, "5": 1, "distribut": [1, 37], "left": 1, "shift": [1, 37], "over": [1, 37], "distributeshift": 1, "also": [1, 37], "look": [1, 41, 42], "taint": [1, 41], "function": [1, 5, 6, 7, 8, 9, 10, 14, 16, 17, 18, 19, 21, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 35, 41], "pointer": [1, 41], "e": [1, 8, 37, 41], "dispatch": [1, 4, 31, 41], "taintedfunctionpoint": 1, "sinc": 1, "inspectr": [1, 2, 40, 42], "list": [1, 36, 37, 40, 42], "memori": [1, 16, 25, 37, 40, 41, 42], "realli": 1, "need": [1, 9, 37, 41, 42], "easiest": 1, "approach": [1, 40], "mark": [1, 42], "appli": [1, 37], "csv": [1, 40, 41, 42], "howev": [1, 40], "possibl": 1, "restrict": 1, "set": [1, 2, 4, 8, 37], "beforehand": 1, "other": [1, 8, 37], "can": [1, 2, 5, 37, 40, 41, 42], "tweak": 1, "enabl": 1, "scanner": [1, 2, 19, 36, 38], "same": 1, "address": [1, 5, 18, 24, 37, 42], "express": [1, 6, 27, 37], "like": [1, 40, 42], "treat": 1, "dure": [1, 41], "rang": [1, 37], "scan": 1, "k": [1, 31], "see": 1, "paper": [1, 40, 41], "more": [1, 2, 40], "detail": [1, 2], "In": [2, 37, 41], "folder": [2, 41, 42], "you": [2, 36, 40, 41, 42], "find": [2, 19, 40, 41, 42], "contain": [2, 37], "two": [2, 37, 41], "case": [2, 37, 41], "simpl": 2, "assembli": [2, 20, 42], "snippet": 2, "us": [2, 8, 20, 24, 40, 41, 42], "behavior": [2, 36], "specif": 2, "situat": 2, "refer": [2, 36, 41], "ref": 2, "unit": 2, "intern": [2, 36, 37], "modul": [2, 3, 4, 11, 20, 22, 24, 26, 34], "For": [2, 37, 41, 42], "both": [2, 37], "run": [2, 19, 25, 37, 42], "all": [2, 25, 37, 40, 41, 42], "sh": 2, "script": [2, 42], "against": 2, "about": [2, 36, 40], "how": [2, 6, 9, 36], "readm": 2, "md": 2, "compon": [3, 18, 19, 20, 22, 34, 40, 41], "binari": [3, 19, 37, 40, 42], "extract": [3, 37, 42], "spectr": [3, 40], "transmiss": [3, 4, 5, 6, 9, 16, 18, 19, 25, 34, 37, 40, 41, 42], "properti": [3, 40], "pass": [4, 19, 37], "perform": [4, 22, 27, 37, 40], "thi": [5, 6, 7, 9, 16, 18, 24, 36, 37, 40, 41, 42], "respons": [5, 7, 9, 18, 19, 25], "check": [5, 7, 37], "independ": [5, 37], "from": [5, 8, 37, 40], "secret": [5, 6, 7, 18, 25, 37], "class": [5, 6, 7, 8, 11, 12, 13, 14, 15, 23, 24, 25, 27, 30, 31, 32], "infer": 6, "spread": 6, "ani": [7, 37, 42], "branch": [7, 9, 37, 41], "depend": [7, 8, 37], "graph": 8, "calcul": [8, 16, 24], "symbol": [8, 22, 24, 25, 27, 37, 41], "variabl": [8, 41], "should": [8, 36, 42], "thei": [8, 37, 42], "ti": 8, "togeth": 8, "either": 8, "alias": [8, 24, 37, 41], "involv": 8, "track": 9, "taken": 9, "happen": 9, "condit": [9, 37], "influenc": 9, "final": [9, 37], "have": [16, 37], "leak": [16, 37, 40], "order": [16, 41], "trigger": 16, "identifi": [18, 37], "transmit": [18, 37], "target": 19, "potenti": [19, 37, 40, 42], "3": [19, 37], "4": 19, "collect": 19, "result": [19, 37, 42], "print": 20, "annot": [20, 42], "execut": [22, 25, 37, 40, 41], "model": [24, 25, 40, 41], "while": 24, "avoid": 24, "concret": [24, 37], "overlap": 24, "between": 24, "initi": [25, 41], "engin": 25, "hook": 25, "call": 25, "label": 25, "propag": 25, "enforc": 25, "return": [25, 37], "pure": 25, "except": 25, "data": 26, "type": [26, 41], "transform": 27, "ast": 27, "angr": [27, 37, 40], "normal": 27, "form": [27, 37], "eas": 27, "object": [30, 31, 32, 37, 41], "analyz": [34, 36, 38, 41, 42], "found": [34, 37, 40, 41, 42], "assess": 34, "exploit": [34, 40, 41, 42], "design": [36, 38], "inform": 36, "work": 36, "high": 36, "overview": 36, "its": [36, 37], "pleas": 36, "still": 36, "under": [36, 40], "heavi": 36, "develop": 36, "alwai": 36, "code": [36, 37, 42], "understand": [36, 37], "introduct": 36, "motiv": 36, "licens": 36, "get": 36, "instal": 36, "build": 36, "doc": 36, "usag": 36, "workflow": 36, "demo": 36, "configur": [36, 40], "queri": [36, 40, 41, 42], "test": 36, "linux": 36, "kernel": 36, "experi": 36, "transmissionanalysi": [36, 38], "reason": [36, 38, 40, 42], "api": 36, "asmprint": 36, "share": [36, 41], "divid": 37, "differ": 37, "step": 37, "project": 37, "non": 37, "writabl": 37, "remov": 37, "limit": 37, "been": 37, "classifi": [37, 40], "them": [37, 40], "singl": 37, "multipl": 37, "g": [37, 41], "separ": [37, 40, 41, 42], "seri": 37, "tri": 37, "path": 37, "recov": 37, "visit": 37, "record": [37, 41], "everi": 37, "save": 37, "creat": [37, 40, 41], "new": [37, 41], "newli": 37, "tag": 37, "loadannot": 37, "one": 37, "follow": 37, "uncontrol": 37, "constant": 37, "previou": 37, "correspond": 37, "pc": 37, "complet": [37, 41], "disabl": 37, "At": 37, "report": 37, "instruct": [37, 41], "known": 37, "onli": [37, 42], "support": 37, "now": 37, "onc": 37, "clearli": 37, "being": 37, "possibli": 37, "flush": 37, "reload": [37, 40], "buffer": [37, 40], "first": 37, "canonic": 37, "reduc": 37, "claripi": 37, "simplifi": 37, "covert": 37, "subtract": 37, "sum": 37, "els": 37, "statement": 37, "cmov": 37, "split": [37, 41], "equival": 37, "associ": 37, "b": 37, "c": 37, "sext": 37, "msb": 37, "operand": 37, "concat": 37, "Then": 37, "member": 37, "If": [37, 41], "so": 37, "todo": [39, 41], "program": 40, "inspect": [40, 41, 42], "disclosur": 40, "techniqu": 40, "awar": 40, "read": 40, "problem": 40, "our": [40, 41, 42], "particular": 40, "current": 40, "submiss": 40, "whenev": 40, "chain": 40, "specul": [40, 41, 42], "window": 40, "might": [40, 42], "abl": 40, "through": 40, "side": 40, "channel": 40, "doubl": 40, "equal": 40, "where": [40, 42], "place": 40, "etc": 40, "written": 40, "python": 40, "given": [40, 42], "amount": 40, "By": 40, "default": 40, "actual": 40, "advanc": 40, "tbd": 40, "just": [41, 42], "flatten": 41, "version": 41, "py": 41, "terminologi": 41, "secret_address": 41, "secret_v": 41, "transmitted_secret": 41, "formal": 41, "definit": 41, "mean": 41, "refin": 41, "search": 41, "tfp": 41, "short": 41, "bound": 41, "alia": 41, "load64": 41, "load32": 41, "constrain": 41, "hard": 41, "simpli": 41, "cmove": 41, "sign": 41, "extens": 41, "state": 41, "attach": 41, "child": 41, "These": 41, "cannot": 41, "bypass": 41, "soft": 41, "descript": 41, "somewher": 41, "python3": 42, "clone": 42, "repo": 42, "pip3": 42, "r": 42, "txt": 42, "virtual": 42, "environ": 42, "batcat": 42, "sqlite3": 42, "although": 42, "core": 42, "pip": 42, "sphinx": 42, "myst": 42, "parser": 42, "sphinx_rtd_them": 42, "rtd": 42, "cd": 42, "make": 42, "html": 42, "open": 42, "_build": 42, "index": 42, "browser": 42, "ones": 42, "format": 42, "hex_address": 42, "entrypoint_nam": 42, "sourc": 42, "name": 42, "option": 42, "csv_file": 42, "yaml_config": 42, "asm": 42, "produc": 42, "input": 42, "invok": 42, "subcommand": 42, "help": 42, "typic": 42, "someth": 42, "mkdir": 42, "out": 42, "config_al": 42, "import": 42, "databas": 42, "db": 42, "cmd": 42, "mode": 42, "tabl": 42, "exploitable_list": 42, "sql": 42, "manual": 42, "interest": 42, "candid": 42, "show": 42, "uuid": 42}, "objects": {"": [[3, 0, 0, "-", "analyzer"], [34, 0, 0, "-", "reasoner"]], "analyzer": [[4, 0, 0, "-", "analysis"], [19, 0, 0, "-", "analyzer"], [20, 0, 0, "-", "asmprinter"], [22, 0, 0, "-", "scanner"], [26, 0, 0, "-", "shared"]], "analyzer.analysis": [[5, 0, 0, "-", "baseControlAnalysis"], [6, 0, 0, "-", "bitsAnalysis"], [7, 0, 0, "-", "branchControlAnalysis"], [8, 0, 0, "-", "dependencyGraph"], [9, 0, 0, "-", "pathAnalysis"], [10, 0, 0, "-", "rangeAnalysis"], [11, 0, 0, "-", "range_strategies"], [16, 0, 0, "-", "requirementsAnalysis"], [17, 0, 0, "-", "tfpAnalysis"], [18, 0, 0, "-", "transmissionAnalysis"]], "analyzer.analysis.range_strategies": [[12, 0, 0, "-", "find_constraints_bounds"], [13, 0, 0, "-", "find_masking"], [14, 0, 0, "-", "infer_isolated"], [15, 0, 0, "-", "small_set"]], "analyzer.asmprinter": [[21, 0, 0, "-", "asmprinter"]], "analyzer.scanner": [[23, 0, 0, "-", "annotations"], [24, 0, 0, "-", "memory"], [25, 0, 0, "-", "scanner"]], "analyzer.shared": [[27, 0, 0, "-", "astTransform"], [28, 0, 0, "-", "config"], [29, 0, 0, "-", "logger"], [30, 0, 0, "-", "ranges"], [31, 0, 0, "-", "taintedFunctionPointer"], [32, 0, 0, "-", "transmission"], [33, 0, 0, "-", "utils"]], "reasoner": [[35, 0, 0, "-", "reasoner"]]}, "objtypes": {"0": "py:module"}, "objnames": {"0": ["py", "module", "Python module"]}, "titleterms": {"api": 0, "refer": 0, "configur": 1, "exampl": 2, "queri": 2, "test": 2, "linux": 2, "kernel": 2, "experi": 2, "analyz": [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 37], "analysi": [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], "basecontrolanalysi": 5, "bitsanalysi": 6, "branchcontrolanalysi": 7, "dependencygraph": 8, "pathanalysi": 9, "rangeanalysi": 10, "range_strategi": [11, 12, 13, 14, 15], "find_constraints_bound": 12, "find_mask": 13, "infer_isol": 14, "small_set": 15, "requirementsanalysi": 16, "tfpanalysi": 17, "transmissionanalysi": [18, 37], "asmprint": [20, 21], "scanner": [22, 23, 24, 25, 37], "annot": 23, "memori": 24, "share": [26, 27, 28, 29, 30, 31, 32, 33], "asttransform": 27, "config": 28, "logger": 29, "rang": 30, "taintedfunctionpoint": 31, "transmiss": 32, "util": 33, "reason": [34, 35, 39], "welcom": 36, "inspectr": 36, "gadget": 36, "": 36, "document": 36, "design": 37, "intern": 38, "introduct": 40, "motiv": 40, "how": 40, "work": 40, "licens": 40, "output": 41, "column": 41, "list": 41, "get": 42, "start": 42, "instal": 42, "build": 42, "doc": 42, "usag": 42, "workflow": 42, "demo": 42}, "envversion": {"sphinx.domains.c": 3, "sphinx.domains.changeset": 1, "sphinx.domains.citation": 1, "sphinx.domains.cpp": 9, "sphinx.domains.index": 1, "sphinx.domains.javascript": 3, "sphinx.domains.math": 2, "sphinx.domains.python": 4, "sphinx.domains.rst": 2, "sphinx.domains.std": 2, "sphinx": 60}, "alltitles": {"API Reference": [[0, "api-reference"]], "Configuration": [[1, "configuration"]], "Examples": [[2, "examples"]], "Queries": [[2, "queries"]], "Tests": [[2, "tests"]], "Linux Kernel Experiment": [[2, "linux-kernel-experiment"]], "analyzer": [[3, "module-analyzer"]], "analyzer.analysis": [[4, "module-analyzer.analysis"]], "analyzer.analysis.baseControlAnalysis": [[5, "module-analyzer.analysis.baseControlAnalysis"]], "analyzer.analysis.bitsAnalysis": [[6, "module-analyzer.analysis.bitsAnalysis"]], "analyzer.analysis.branchControlAnalysis": [[7, "module-analyzer.analysis.branchControlAnalysis"]], "analyzer.analysis.dependencyGraph": [[8, "module-analyzer.analysis.dependencyGraph"]], "analyzer.analysis.pathAnalysis": [[9, "module-analyzer.analysis.pathAnalysis"]], "analyzer.analysis.rangeAnalysis": [[10, "module-analyzer.analysis.rangeAnalysis"]], "analyzer.analysis.range_strategies": [[11, "module-analyzer.analysis.range_strategies"]], "analyzer.analysis.range_strategies.find_constraints_bounds": [[12, "module-analyzer.analysis.range_strategies.find_constraints_bounds"]], "analyzer.analysis.range_strategies.find_masking": [[13, "module-analyzer.analysis.range_strategies.find_masking"]], "analyzer.analysis.range_strategies.infer_isolated": [[14, "module-analyzer.analysis.range_strategies.infer_isolated"]], "analyzer.analysis.range_strategies.small_set": [[15, "module-analyzer.analysis.range_strategies.small_set"]], "analyzer.analysis.requirementsAnalysis": [[16, "module-analyzer.analysis.requirementsAnalysis"]], "analyzer.analysis.tfpAnalysis": [[17, "module-analyzer.analysis.tfpAnalysis"]], "analyzer.analysis.transmissionAnalysis": [[18, "module-analyzer.analysis.transmissionAnalysis"]], "analyzer.analyzer": [[19, "module-analyzer.analyzer"]], "analyzer.asmprinter": [[20, "module-analyzer.asmprinter"]], "analyzer.asmprinter.asmprinter": [[21, "module-analyzer.asmprinter.asmprinter"]], "analyzer.scanner": [[22, "module-analyzer.scanner"]], "analyzer.scanner.annotations": [[23, "module-analyzer.scanner.annotations"]], "analyzer.scanner.memory": [[24, "module-analyzer.scanner.memory"]], "analyzer.scanner.scanner": [[25, "module-analyzer.scanner.scanner"]], "analyzer.shared": [[26, "module-analyzer.shared"]], "analyzer.shared.astTransform": [[27, "module-analyzer.shared.astTransform"]], "analyzer.shared.config": [[28, "module-analyzer.shared.config"]], "analyzer.shared.logger": [[29, "module-analyzer.shared.logger"]], "analyzer.shared.ranges": [[30, "module-analyzer.shared.ranges"]], "analyzer.shared.taintedFunctionPointer": [[31, "module-analyzer.shared.taintedFunctionPointer"]], "analyzer.shared.transmission": [[32, "module-analyzer.shared.transmission"]], "analyzer.shared.utils": [[33, "module-analyzer.shared.utils"]], "reasoner": [[34, "module-reasoner"]], "reasoner.reasoner": [[35, "module-reasoner.reasoner"]], "Welcome to InSpectre Gadget\u2019s documentation!": [[36, "welcome-to-inspectre-gadget-s-documentation"]], "Analyzer": [[37, "analyzer"]], "Design": [[37, "design"]], "Scanner": [[37, "scanner"]], "TransmissionAnalysis": [[37, "transmissionanalysis"]], "Internals": [[38, "internals"]], "Reasoner": [[39, "reasoner"]], "Introduction": [[40, "introduction"]], "Motivation": [[40, "motivation"]], "How it works": [[40, "how-it-works"]], "License": [[40, "license"]], "Output": [[41, "output"]], "Column List": [[41, "column-list"]], "Getting Started": [[42, "getting-started"]], "Installation": [[42, "installation"]], "Build Docs": [[42, "build-docs"]], "Usage": [[42, "usage"]], "Workflow": [[42, "workflow"]], "Demo": [[42, "demo"]]}, "indexentries": {"analyzer": [[3, "module-analyzer"]], "module": [[3, "module-analyzer"], [4, "module-analyzer.analysis"], [5, "module-analyzer.analysis.baseControlAnalysis"], [6, "module-analyzer.analysis.bitsAnalysis"], [7, "module-analyzer.analysis.branchControlAnalysis"], [8, "module-analyzer.analysis.dependencyGraph"], [9, "module-analyzer.analysis.pathAnalysis"], [10, "module-analyzer.analysis.rangeAnalysis"], [11, "module-analyzer.analysis.range_strategies"], [12, "module-analyzer.analysis.range_strategies.find_constraints_bounds"], [13, "module-analyzer.analysis.range_strategies.find_masking"], [14, "module-analyzer.analysis.range_strategies.infer_isolated"], [15, "module-analyzer.analysis.range_strategies.small_set"], [16, "module-analyzer.analysis.requirementsAnalysis"], [17, "module-analyzer.analysis.tfpAnalysis"], [18, "module-analyzer.analysis.transmissionAnalysis"], [19, "module-analyzer.analyzer"], [20, "module-analyzer.asmprinter"], [21, "module-analyzer.asmprinter.asmprinter"], [22, "module-analyzer.scanner"], [23, "module-analyzer.scanner.annotations"], [24, "module-analyzer.scanner.memory"], [25, "module-analyzer.scanner.scanner"], [26, "module-analyzer.shared"], [27, "module-analyzer.shared.astTransform"], [28, "module-analyzer.shared.config"], [29, "module-analyzer.shared.logger"], [30, "module-analyzer.shared.ranges"], [31, "module-analyzer.shared.taintedFunctionPointer"], [32, "module-analyzer.shared.transmission"], [33, "module-analyzer.shared.utils"], [34, "module-reasoner"], [35, "module-reasoner.reasoner"]], "analyzer.analysis": [[4, "module-analyzer.analysis"]], "analyzer.analysis.basecontrolanalysis": [[5, "module-analyzer.analysis.baseControlAnalysis"]], "analyzer.analysis.bitsanalysis": [[6, "module-analyzer.analysis.bitsAnalysis"]], "analyzer.analysis.branchcontrolanalysis": [[7, "module-analyzer.analysis.branchControlAnalysis"]], "analyzer.analysis.dependencygraph": [[8, "module-analyzer.analysis.dependencyGraph"]], "analyzer.analysis.pathanalysis": [[9, "module-analyzer.analysis.pathAnalysis"]], "analyzer.analysis.rangeanalysis": [[10, "module-analyzer.analysis.rangeAnalysis"]], "analyzer.analysis.range_strategies": [[11, "module-analyzer.analysis.range_strategies"]], "analyzer.analysis.range_strategies.find_constraints_bounds": [[12, "module-analyzer.analysis.range_strategies.find_constraints_bounds"]], "analyzer.analysis.range_strategies.find_masking": [[13, "module-analyzer.analysis.range_strategies.find_masking"]], "analyzer.analysis.range_strategies.infer_isolated": [[14, "module-analyzer.analysis.range_strategies.infer_isolated"]], "analyzer.analysis.range_strategies.small_set": [[15, "module-analyzer.analysis.range_strategies.small_set"]], "analyzer.analysis.requirementsanalysis": [[16, "module-analyzer.analysis.requirementsAnalysis"]], "analyzer.analysis.tfpanalysis": [[17, "module-analyzer.analysis.tfpAnalysis"]], "analyzer.analysis.transmissionanalysis": [[18, "module-analyzer.analysis.transmissionAnalysis"]], "analyzer.analyzer": [[19, "module-analyzer.analyzer"]], "analyzer.asmprinter": [[20, "module-analyzer.asmprinter"]], "analyzer.asmprinter.asmprinter": [[21, "module-analyzer.asmprinter.asmprinter"]], "analyzer.scanner": [[22, "module-analyzer.scanner"]], "analyzer.scanner.annotations": [[23, "module-analyzer.scanner.annotations"]], "analyzer.scanner.memory": [[24, "module-analyzer.scanner.memory"]], "analyzer.scanner.scanner": [[25, "module-analyzer.scanner.scanner"]], "analyzer.shared": [[26, "module-analyzer.shared"]], "analyzer.shared.asttransform": [[27, "module-analyzer.shared.astTransform"]], "analyzer.shared.config": [[28, "module-analyzer.shared.config"]], "analyzer.shared.logger": [[29, "module-analyzer.shared.logger"]], "analyzer.shared.ranges": [[30, "module-analyzer.shared.ranges"]], "analyzer.shared.taintedfunctionpointer": [[31, "module-analyzer.shared.taintedFunctionPointer"]], "analyzer.shared.transmission": [[32, "module-analyzer.shared.transmission"]], "analyzer.shared.utils": [[33, "module-analyzer.shared.utils"]], "reasoner": [[34, "module-reasoner"]], "reasoner.reasoner": [[35, "module-reasoner.reasoner"]]}})