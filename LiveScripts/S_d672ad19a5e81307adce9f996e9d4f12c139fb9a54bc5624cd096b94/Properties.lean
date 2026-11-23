import LiveScripts.Shared
import LiveScripts.S_d672ad19a5e81307adce9f996e9d4f12c139fb9a54bc5624cd096b94.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d672ad19a5e81307adce9f996e9d4f12c139fb9a54bc5624cd096b94.script [redeemer, ctx] 10000]
