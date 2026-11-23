import LiveScripts.Shared
import LiveScripts.S_489c7af4adee90a9083e239fc9d832989187853b8abd34661814fa60.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_489c7af4adee90a9083e239fc9d832989187853b8abd34661814fa60.script [ctx] 10000]
