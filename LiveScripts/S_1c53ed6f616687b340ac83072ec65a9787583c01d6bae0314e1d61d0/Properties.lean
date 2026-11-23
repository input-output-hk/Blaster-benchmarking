import LiveScripts.Shared
import LiveScripts.S_1c53ed6f616687b340ac83072ec65a9787583c01d6bae0314e1d61d0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1c53ed6f616687b340ac83072ec65a9787583c01d6bae0314e1d61d0.script [ctx] 10000]
