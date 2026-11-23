import LiveScripts.Shared
import LiveScripts.S_c4ba161e77d689d2540465ed2c119ce83e7c1d2495e4dce3b3284c44.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c4ba161e77d689d2540465ed2c119ce83e7c1d2495e4dce3b3284c44.script [ctx] 10000]
