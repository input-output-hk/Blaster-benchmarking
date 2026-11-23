import LiveScripts.Shared
import LiveScripts.S_f71cb5b7e02310ce618920b331edb83c985f13bad5d8d285a8f07085.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f71cb5b7e02310ce618920b331edb83c985f13bad5d8d285a8f07085.script [datum, redeemer, ctx] 10000]
