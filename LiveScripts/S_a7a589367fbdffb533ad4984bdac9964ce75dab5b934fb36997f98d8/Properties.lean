import LiveScripts.Shared
import LiveScripts.S_a7a589367fbdffb533ad4984bdac9964ce75dab5b934fb36997f98d8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a7a589367fbdffb533ad4984bdac9964ce75dab5b934fb36997f98d8.script [ctx] 10000]
