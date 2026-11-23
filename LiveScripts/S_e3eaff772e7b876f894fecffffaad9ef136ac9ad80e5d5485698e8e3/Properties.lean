import LiveScripts.Shared
import LiveScripts.S_e3eaff772e7b876f894fecffffaad9ef136ac9ad80e5d5485698e8e3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e3eaff772e7b876f894fecffffaad9ef136ac9ad80e5d5485698e8e3.script [ctx] 10000]
