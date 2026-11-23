import LiveScripts.Shared
import LiveScripts.S_df03dd1c8799efa89cf5c9997ec81de3cf3096edaec36495663e1db0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_df03dd1c8799efa89cf5c9997ec81de3cf3096edaec36495663e1db0.script [ctx] 10000]
