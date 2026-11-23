import LiveScripts.Shared
import LiveScripts.S_1bcd2ac824b02aac21c4a018138aca4884c99fb3b9bca64d6240af2e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1bcd2ac824b02aac21c4a018138aca4884c99fb3b9bca64d6240af2e.script [ctx] 10000]
