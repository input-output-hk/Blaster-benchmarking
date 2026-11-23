import LiveScripts.Shared
import LiveScripts.S_908dfc150444a349ac6350f4b337c0d4df5de15f5af90f27aae6ec85.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_908dfc150444a349ac6350f4b337c0d4df5de15f5af90f27aae6ec85.script [ctx] 10000]
