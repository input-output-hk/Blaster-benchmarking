import LiveScripts.Shared
import LiveScripts.S_8a0b647eef6f7dbafa9dfda4bc9c41dc2e746d93242d70165bb78469.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8a0b647eef6f7dbafa9dfda4bc9c41dc2e746d93242d70165bb78469.script [ctx] 10000]
