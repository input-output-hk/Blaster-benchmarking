import LiveScripts.Shared
import LiveScripts.S_dfdcfae7bb3a9de87f4cb9db698d57e972a7cac9e8a9ad77bee8631a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dfdcfae7bb3a9de87f4cb9db698d57e972a7cac9e8a9ad77bee8631a.script [redeemer, ctx] 10000]
