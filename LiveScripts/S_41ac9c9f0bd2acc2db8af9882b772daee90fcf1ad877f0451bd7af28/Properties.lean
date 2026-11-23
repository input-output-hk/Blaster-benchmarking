import LiveScripts.Shared
import LiveScripts.S_41ac9c9f0bd2acc2db8af9882b772daee90fcf1ad877f0451bd7af28.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_41ac9c9f0bd2acc2db8af9882b772daee90fcf1ad877f0451bd7af28.script [ctx] 10000]
