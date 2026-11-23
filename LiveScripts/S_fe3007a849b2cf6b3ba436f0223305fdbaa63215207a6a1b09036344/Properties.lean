import LiveScripts.Shared
import LiveScripts.S_fe3007a849b2cf6b3ba436f0223305fdbaa63215207a6a1b09036344.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fe3007a849b2cf6b3ba436f0223305fdbaa63215207a6a1b09036344.script [redeemer, ctx] 10000]
