import LiveScripts.Shared
import LiveScripts.S_b5afe05c428bc830cde966273ccfa3018062c54a6488fd4d5e4dc248.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5afe05c428bc830cde966273ccfa3018062c54a6488fd4d5e4dc248.script [ctx] 10000]
