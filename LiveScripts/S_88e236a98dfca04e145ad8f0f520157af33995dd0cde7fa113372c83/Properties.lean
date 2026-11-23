import LiveScripts.Shared
import LiveScripts.S_88e236a98dfca04e145ad8f0f520157af33995dd0cde7fa113372c83.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_88e236a98dfca04e145ad8f0f520157af33995dd0cde7fa113372c83.script [redeemer, ctx] 10000]
