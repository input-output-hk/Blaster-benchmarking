import LiveScripts.Shared
import LiveScripts.S_8a853c83e4e2c84c7a6c707f75e3bdc8242a6c40422fb4ee5d53ccba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8a853c83e4e2c84c7a6c707f75e3bdc8242a6c40422fb4ee5d53ccba.script [datum, redeemer, ctx] 10000]
