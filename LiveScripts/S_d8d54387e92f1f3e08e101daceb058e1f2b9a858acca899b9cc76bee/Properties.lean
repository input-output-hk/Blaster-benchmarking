import LiveScripts.Shared
import LiveScripts.S_d8d54387e92f1f3e08e101daceb058e1f2b9a858acca899b9cc76bee.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d8d54387e92f1f3e08e101daceb058e1f2b9a858acca899b9cc76bee.script [ctx] 10000]
