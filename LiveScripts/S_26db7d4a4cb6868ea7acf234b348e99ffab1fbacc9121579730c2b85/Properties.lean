import LiveScripts.Shared
import LiveScripts.S_26db7d4a4cb6868ea7acf234b348e99ffab1fbacc9121579730c2b85.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_26db7d4a4cb6868ea7acf234b348e99ffab1fbacc9121579730c2b85.script [ctx] 10000]
