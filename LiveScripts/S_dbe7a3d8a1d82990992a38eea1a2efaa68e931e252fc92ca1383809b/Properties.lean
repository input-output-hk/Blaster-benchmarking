import LiveScripts.Shared
import LiveScripts.S_dbe7a3d8a1d82990992a38eea1a2efaa68e931e252fc92ca1383809b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dbe7a3d8a1d82990992a38eea1a2efaa68e931e252fc92ca1383809b.script [datum, redeemer, ctx] 10000]
