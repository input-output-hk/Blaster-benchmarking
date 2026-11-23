import LiveScripts.Shared
import LiveScripts.S_78514705c320a96a8141f7075335b169489cc8bf65f9f18b9cdae488.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78514705c320a96a8141f7075335b169489cc8bf65f9f18b9cdae488.script [ctx] 10000]
