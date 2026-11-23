import LiveScripts.Shared
import LiveScripts.S_c4d2b22966d0feac566022f66974053a057caaa41203535506317a67.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c4d2b22966d0feac566022f66974053a057caaa41203535506317a67.script [ctx] 10000]
