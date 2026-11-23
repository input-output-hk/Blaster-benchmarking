import LiveScripts.Shared
import LiveScripts.S_984fd887524703d14fcbce8561df62176453af73edcbe1dce31d4242.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_984fd887524703d14fcbce8561df62176453af73edcbe1dce31d4242.script [ctx] 10000]
