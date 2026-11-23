import LiveScripts.Shared
import LiveScripts.S_306dfe1f3f35dea76796ad0b2547f1bcdd9b333051a0d87dde0b8b42.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_306dfe1f3f35dea76796ad0b2547f1bcdd9b333051a0d87dde0b8b42.script [ctx] 10000]
