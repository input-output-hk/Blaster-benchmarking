import LiveScripts.Shared
import LiveScripts.S_ddb34e5ab278c6b8e2ee95af4c8b175f8329861cb098d7b093edf5b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ddb34e5ab278c6b8e2ee95af4c8b175f8329861cb098d7b093edf5b5.script [ctx] 10000]
