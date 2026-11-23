import LiveScripts.Shared
import LiveScripts.S_e992a1eacd9d4f841609a34ff56ea4476cd4a7ae6c48daea1ad6362a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e992a1eacd9d4f841609a34ff56ea4476cd4a7ae6c48daea1ad6362a.script [redeemer, ctx] 10000]
