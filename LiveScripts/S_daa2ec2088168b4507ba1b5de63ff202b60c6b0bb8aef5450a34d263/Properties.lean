import LiveScripts.Shared
import LiveScripts.S_daa2ec2088168b4507ba1b5de63ff202b60c6b0bb8aef5450a34d263.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_daa2ec2088168b4507ba1b5de63ff202b60c6b0bb8aef5450a34d263.script [redeemer, ctx] 10000]
