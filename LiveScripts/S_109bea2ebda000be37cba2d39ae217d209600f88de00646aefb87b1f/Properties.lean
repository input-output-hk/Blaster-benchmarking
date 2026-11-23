import LiveScripts.Shared
import LiveScripts.S_109bea2ebda000be37cba2d39ae217d209600f88de00646aefb87b1f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_109bea2ebda000be37cba2d39ae217d209600f88de00646aefb87b1f.script [ctx] 10000]
