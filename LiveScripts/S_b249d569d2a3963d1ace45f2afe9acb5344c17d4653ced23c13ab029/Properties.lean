import LiveScripts.Shared
import LiveScripts.S_b249d569d2a3963d1ace45f2afe9acb5344c17d4653ced23c13ab029.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b249d569d2a3963d1ace45f2afe9acb5344c17d4653ced23c13ab029.script [datum, redeemer, ctx] 10000]
