import LiveScripts.Shared
import LiveScripts.S_ab51bd8c5b05de47ddd7294deb8c23c0378e2245dc354bb695859280.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ab51bd8c5b05de47ddd7294deb8c23c0378e2245dc354bb695859280.script [ctx] 10000]
