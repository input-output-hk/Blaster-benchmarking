import LiveScripts.Shared
import LiveScripts.S_ecb3ce037188879d7fea47aa5e7eb4cbb1e24479816bf439e57acbc6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ecb3ce037188879d7fea47aa5e7eb4cbb1e24479816bf439e57acbc6.script [ctx] 10000]
