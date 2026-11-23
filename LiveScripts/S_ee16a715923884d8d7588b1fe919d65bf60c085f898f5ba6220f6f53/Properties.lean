import LiveScripts.Shared
import LiveScripts.S_ee16a715923884d8d7588b1fe919d65bf60c085f898f5ba6220f6f53.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ee16a715923884d8d7588b1fe919d65bf60c085f898f5ba6220f6f53.script [ctx] 10000]
