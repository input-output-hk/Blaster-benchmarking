import LiveScripts.Shared
import LiveScripts.S_ad31c15c334d34c152003a6c33aa34cb4c3e19fb7411135d1ceacbb3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ad31c15c334d34c152003a6c33aa34cb4c3e19fb7411135d1ceacbb3.script [datum, redeemer, ctx] 10000]
