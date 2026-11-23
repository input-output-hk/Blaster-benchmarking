import LiveScripts.Shared
import LiveScripts.S_1c9ae8ad71f797df8ef6f1f645430a60dc55e1793afd0110aee96b9a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1c9ae8ad71f797df8ef6f1f645430a60dc55e1793afd0110aee96b9a.script [datum, redeemer, ctx] 10000]
