import LiveScripts.Shared
import LiveScripts.S_b509bae825b87a3e69d5f0b8244ef77e28ae944e882205772229e080.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b509bae825b87a3e69d5f0b8244ef77e28ae944e882205772229e080.script [redeemer, ctx] 10000]
