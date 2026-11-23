import LiveScripts.Shared
import LiveScripts.S_10eb0642ee5d4746d0ccff8c36b24550af1010245b1b3c5a55fe471f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10eb0642ee5d4746d0ccff8c36b24550af1010245b1b3c5a55fe471f.script [ctx] 10000]
