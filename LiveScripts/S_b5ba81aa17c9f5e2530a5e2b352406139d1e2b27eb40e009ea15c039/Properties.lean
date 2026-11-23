import LiveScripts.Shared
import LiveScripts.S_b5ba81aa17c9f5e2530a5e2b352406139d1e2b27eb40e009ea15c039.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5ba81aa17c9f5e2530a5e2b352406139d1e2b27eb40e009ea15c039.script [datum, redeemer, ctx] 10000]
