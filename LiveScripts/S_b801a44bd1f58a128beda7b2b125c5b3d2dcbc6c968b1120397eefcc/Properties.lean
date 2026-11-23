import LiveScripts.Shared
import LiveScripts.S_b801a44bd1f58a128beda7b2b125c5b3d2dcbc6c968b1120397eefcc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b801a44bd1f58a128beda7b2b125c5b3d2dcbc6c968b1120397eefcc.script [ctx] 10000]
