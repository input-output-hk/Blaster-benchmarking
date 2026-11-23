import LiveScripts.Shared
import LiveScripts.S_30f1095a8a2acb68bb0ffa193e18e004b6dd3e12b5d9c2375a1d5c41.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_30f1095a8a2acb68bb0ffa193e18e004b6dd3e12b5d9c2375a1d5c41.script [ctx] 10000]
