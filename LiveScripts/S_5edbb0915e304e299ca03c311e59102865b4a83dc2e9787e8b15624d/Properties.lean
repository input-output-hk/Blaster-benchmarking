import LiveScripts.Shared
import LiveScripts.S_5edbb0915e304e299ca03c311e59102865b4a83dc2e9787e8b15624d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5edbb0915e304e299ca03c311e59102865b4a83dc2e9787e8b15624d.script [redeemer, ctx] 10000]
