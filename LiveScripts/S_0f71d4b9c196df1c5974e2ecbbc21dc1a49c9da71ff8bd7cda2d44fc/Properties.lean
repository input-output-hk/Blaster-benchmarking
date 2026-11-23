import LiveScripts.Shared
import LiveScripts.S_0f71d4b9c196df1c5974e2ecbbc21dc1a49c9da71ff8bd7cda2d44fc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0f71d4b9c196df1c5974e2ecbbc21dc1a49c9da71ff8bd7cda2d44fc.script [datum, redeemer, ctx] 10000]
