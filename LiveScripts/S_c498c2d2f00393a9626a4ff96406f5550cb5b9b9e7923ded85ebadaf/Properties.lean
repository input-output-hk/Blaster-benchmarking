import LiveScripts.Shared
import LiveScripts.S_c498c2d2f00393a9626a4ff96406f5550cb5b9b9e7923ded85ebadaf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c498c2d2f00393a9626a4ff96406f5550cb5b9b9e7923ded85ebadaf.script [ctx] 10000]
