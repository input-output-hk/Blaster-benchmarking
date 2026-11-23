import LiveScripts.Shared
import LiveScripts.S_dda8ee5e9e7dd45a17c5d86f423c90dd1568390447f4ab2f78750afa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dda8ee5e9e7dd45a17c5d86f423c90dd1568390447f4ab2f78750afa.script [ctx] 10000]
