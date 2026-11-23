import LiveScripts.Shared
import LiveScripts.S_1b0dd8116b942d95fa8e506a118e2edc42e24b9d1b1cd78bd858e6fb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1b0dd8116b942d95fa8e506a118e2edc42e24b9d1b1cd78bd858e6fb.script [ctx] 10000]
