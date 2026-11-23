import LiveScripts.Shared
import LiveScripts.S_e9d2d3ad93bd955c60cb9cadf7534a5c88285d8a4dd0ae995523e36c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e9d2d3ad93bd955c60cb9cadf7534a5c88285d8a4dd0ae995523e36c.script [redeemer, ctx] 10000]
