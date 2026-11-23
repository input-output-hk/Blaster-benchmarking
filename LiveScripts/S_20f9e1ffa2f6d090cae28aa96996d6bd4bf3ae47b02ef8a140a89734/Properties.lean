import LiveScripts.Shared
import LiveScripts.S_20f9e1ffa2f6d090cae28aa96996d6bd4bf3ae47b02ef8a140a89734.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_20f9e1ffa2f6d090cae28aa96996d6bd4bf3ae47b02ef8a140a89734.script [ctx] 10000]
