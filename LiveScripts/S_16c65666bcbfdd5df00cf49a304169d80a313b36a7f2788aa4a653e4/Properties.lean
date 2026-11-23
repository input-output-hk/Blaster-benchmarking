import LiveScripts.Shared
import LiveScripts.S_16c65666bcbfdd5df00cf49a304169d80a313b36a7f2788aa4a653e4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_16c65666bcbfdd5df00cf49a304169d80a313b36a7f2788aa4a653e4.script [ctx] 10000]
