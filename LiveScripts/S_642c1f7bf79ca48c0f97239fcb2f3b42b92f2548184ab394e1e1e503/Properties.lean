import LiveScripts.Shared
import LiveScripts.S_642c1f7bf79ca48c0f97239fcb2f3b42b92f2548184ab394e1e1e503.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_642c1f7bf79ca48c0f97239fcb2f3b42b92f2548184ab394e1e1e503.script [redeemer, ctx] 10000]
