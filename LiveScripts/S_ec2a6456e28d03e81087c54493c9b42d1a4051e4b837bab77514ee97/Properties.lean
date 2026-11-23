import LiveScripts.Shared
import LiveScripts.S_ec2a6456e28d03e81087c54493c9b42d1a4051e4b837bab77514ee97.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ec2a6456e28d03e81087c54493c9b42d1a4051e4b837bab77514ee97.script [datum, redeemer, ctx] 10000]
