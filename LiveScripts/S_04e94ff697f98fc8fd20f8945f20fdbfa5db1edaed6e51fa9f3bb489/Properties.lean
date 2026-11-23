import LiveScripts.Shared
import LiveScripts.S_04e94ff697f98fc8fd20f8945f20fdbfa5db1edaed6e51fa9f3bb489.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_04e94ff697f98fc8fd20f8945f20fdbfa5db1edaed6e51fa9f3bb489.script [redeemer, ctx] 10000]
