import LiveScripts.Shared
import LiveScripts.S_ee2f280f1b5622eb79ff73b7698767682a450d07f1c67b0dcba912eb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ee2f280f1b5622eb79ff73b7698767682a450d07f1c67b0dcba912eb.script [ctx] 10000]
