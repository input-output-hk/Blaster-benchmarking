import LiveScripts.Shared
import LiveScripts.S_0a900fab8c88de81cab7693b48c7d906221f1cf305f4b8e75c565558.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0a900fab8c88de81cab7693b48c7d906221f1cf305f4b8e75c565558.script [ctx] 10000]
