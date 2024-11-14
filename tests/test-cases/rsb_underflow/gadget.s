rsp_underflow:
   bl     dummy_call           // Branch with link to dummy_call (calls the function)
   ret                         // Return from rsp_underflow (We should not count this as a TFP)

dummy_call:
   ret                         // Return from dummy_call (simple return)
