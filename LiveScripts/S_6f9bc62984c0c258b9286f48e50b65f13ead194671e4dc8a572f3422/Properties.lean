import LiveScripts.Shared
import LiveScripts.S_6f9bc62984c0c258b9286f48e50b65f13ead194671e4dc8a572f3422.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f9bc62984c0c258b9286f48e50b65f13ead194671e4dc8a572f3422.script [ctx] 10000]
