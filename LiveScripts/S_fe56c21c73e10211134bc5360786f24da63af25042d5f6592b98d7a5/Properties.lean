import LiveScripts.Shared
import LiveScripts.S_fe56c21c73e10211134bc5360786f24da63af25042d5f6592b98d7a5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fe56c21c73e10211134bc5360786f24da63af25042d5f6592b98d7a5.script [ctx] 10000]
