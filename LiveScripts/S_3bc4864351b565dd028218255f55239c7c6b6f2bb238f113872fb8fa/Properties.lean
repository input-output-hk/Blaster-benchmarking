import LiveScripts.Shared
import LiveScripts.S_3bc4864351b565dd028218255f55239c7c6b6f2bb238f113872fb8fa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3bc4864351b565dd028218255f55239c7c6b6f2bb238f113872fb8fa.script [ctx] 10000]
