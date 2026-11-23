import LiveScripts.Shared
import LiveScripts.S_d0d6283d0516b02d60864a85ed8f2918fc85e43a5fe1137b1cfeaba7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d0d6283d0516b02d60864a85ed8f2918fc85e43a5fe1137b1cfeaba7.script [ctx] 10000]
