import LiveScripts.Shared
import LiveScripts.S_4c9e166fc2d21771b6d6f1d0b1df51a210de66bfbdb433d7859f2e81.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4c9e166fc2d21771b6d6f1d0b1df51a210de66bfbdb433d7859f2e81.script [datum, redeemer, ctx] 10000]
