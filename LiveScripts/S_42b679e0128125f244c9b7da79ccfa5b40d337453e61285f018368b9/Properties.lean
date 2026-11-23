import LiveScripts.Shared
import LiveScripts.S_42b679e0128125f244c9b7da79ccfa5b40d337453e61285f018368b9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_42b679e0128125f244c9b7da79ccfa5b40d337453e61285f018368b9.script [ctx] 10000]
