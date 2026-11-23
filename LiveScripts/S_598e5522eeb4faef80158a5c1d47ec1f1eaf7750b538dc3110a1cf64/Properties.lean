import LiveScripts.Shared
import LiveScripts.S_598e5522eeb4faef80158a5c1d47ec1f1eaf7750b538dc3110a1cf64.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_598e5522eeb4faef80158a5c1d47ec1f1eaf7750b538dc3110a1cf64.script [ctx] 10000]
