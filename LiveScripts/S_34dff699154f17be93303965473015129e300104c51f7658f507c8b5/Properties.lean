import LiveScripts.Shared
import LiveScripts.S_34dff699154f17be93303965473015129e300104c51f7658f507c8b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_34dff699154f17be93303965473015129e300104c51f7658f507c8b5.script [ctx] 10000]
