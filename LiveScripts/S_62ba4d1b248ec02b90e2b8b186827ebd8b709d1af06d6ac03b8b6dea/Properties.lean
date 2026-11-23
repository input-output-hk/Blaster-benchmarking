import LiveScripts.Shared
import LiveScripts.S_62ba4d1b248ec02b90e2b8b186827ebd8b709d1af06d6ac03b8b6dea.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62ba4d1b248ec02b90e2b8b186827ebd8b709d1af06d6ac03b8b6dea.script [ctx] 10000]
