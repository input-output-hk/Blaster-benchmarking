import LiveScripts.Shared
import LiveScripts.S_5d7b3b924dddf79c4de055d474fb4f5ef0824815caa57b96eeda1a92.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5d7b3b924dddf79c4de055d474fb4f5ef0824815caa57b96eeda1a92.script [ctx] 10000]
