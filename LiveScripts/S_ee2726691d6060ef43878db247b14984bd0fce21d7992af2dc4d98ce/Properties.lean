import LiveScripts.Shared
import LiveScripts.S_ee2726691d6060ef43878db247b14984bd0fce21d7992af2dc4d98ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ee2726691d6060ef43878db247b14984bd0fce21d7992af2dc4d98ce.script [ctx] 10000]
