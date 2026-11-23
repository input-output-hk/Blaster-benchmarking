import LiveScripts.Shared
import LiveScripts.S_e07ee8979776692ce3477b0c0d53b4c650ef6ccad75c2596da22847c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e07ee8979776692ce3477b0c0d53b4c650ef6ccad75c2596da22847c.script [datum, redeemer, ctx] 10000]
