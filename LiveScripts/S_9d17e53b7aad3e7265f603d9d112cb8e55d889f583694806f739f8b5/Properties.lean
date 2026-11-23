import LiveScripts.Shared
import LiveScripts.S_9d17e53b7aad3e7265f603d9d112cb8e55d889f583694806f739f8b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9d17e53b7aad3e7265f603d9d112cb8e55d889f583694806f739f8b5.script [datum, redeemer, ctx] 10000]
