import LiveScripts.Shared
import LiveScripts.S_2ba3f2f4e9fddee45aea9202cd6b4b5cbc9fcdee938d4a7f61f30bd1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2ba3f2f4e9fddee45aea9202cd6b4b5cbc9fcdee938d4a7f61f30bd1.script [ctx] 10000]
