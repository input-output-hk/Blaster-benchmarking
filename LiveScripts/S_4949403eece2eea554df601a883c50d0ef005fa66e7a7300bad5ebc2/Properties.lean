import LiveScripts.Shared
import LiveScripts.S_4949403eece2eea554df601a883c50d0ef005fa66e7a7300bad5ebc2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4949403eece2eea554df601a883c50d0ef005fa66e7a7300bad5ebc2.script [ctx] 10000]
