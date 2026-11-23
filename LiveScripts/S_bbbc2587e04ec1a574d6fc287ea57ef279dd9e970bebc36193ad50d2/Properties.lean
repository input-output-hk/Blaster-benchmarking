import LiveScripts.Shared
import LiveScripts.S_bbbc2587e04ec1a574d6fc287ea57ef279dd9e970bebc36193ad50d2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bbbc2587e04ec1a574d6fc287ea57ef279dd9e970bebc36193ad50d2.script [datum, redeemer, ctx] 10000]
