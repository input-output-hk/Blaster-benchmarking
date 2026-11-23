import LiveScripts.Shared
import LiveScripts.S_2d93054a12411b1b24fa26bf81d20a6670973efcee2b3c4c87b3883f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d93054a12411b1b24fa26bf81d20a6670973efcee2b3c4c87b3883f.script [ctx] 10000]
