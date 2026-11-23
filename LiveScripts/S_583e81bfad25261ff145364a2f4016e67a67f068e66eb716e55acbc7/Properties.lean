import LiveScripts.Shared
import LiveScripts.S_583e81bfad25261ff145364a2f4016e67a67f068e66eb716e55acbc7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_583e81bfad25261ff145364a2f4016e67a67f068e66eb716e55acbc7.script [ctx] 10000]
