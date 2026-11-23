import LiveScripts.Shared
import LiveScripts.S_197e41d5e3911e968e3c0c72acb891511aadccb792693af82592c598.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_197e41d5e3911e968e3c0c72acb891511aadccb792693af82592c598.script [redeemer, ctx] 10000]
