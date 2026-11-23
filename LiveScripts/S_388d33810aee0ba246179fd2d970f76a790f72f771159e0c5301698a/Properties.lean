import LiveScripts.Shared
import LiveScripts.S_388d33810aee0ba246179fd2d970f76a790f72f771159e0c5301698a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_388d33810aee0ba246179fd2d970f76a790f72f771159e0c5301698a.script [ctx] 10000]
