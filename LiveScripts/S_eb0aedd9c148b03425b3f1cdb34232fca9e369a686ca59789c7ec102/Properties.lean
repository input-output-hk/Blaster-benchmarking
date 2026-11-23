import LiveScripts.Shared
import LiveScripts.S_eb0aedd9c148b03425b3f1cdb34232fca9e369a686ca59789c7ec102.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb0aedd9c148b03425b3f1cdb34232fca9e369a686ca59789c7ec102.script [ctx] 10000]
