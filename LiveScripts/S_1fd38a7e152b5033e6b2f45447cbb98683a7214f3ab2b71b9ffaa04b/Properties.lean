import LiveScripts.Shared
import LiveScripts.S_1fd38a7e152b5033e6b2f45447cbb98683a7214f3ab2b71b9ffaa04b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1fd38a7e152b5033e6b2f45447cbb98683a7214f3ab2b71b9ffaa04b.script [redeemer, ctx] 10000]
