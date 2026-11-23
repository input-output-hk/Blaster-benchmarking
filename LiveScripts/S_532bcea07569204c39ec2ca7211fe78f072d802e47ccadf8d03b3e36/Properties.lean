import LiveScripts.Shared
import LiveScripts.S_532bcea07569204c39ec2ca7211fe78f072d802e47ccadf8d03b3e36.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_532bcea07569204c39ec2ca7211fe78f072d802e47ccadf8d03b3e36.script [datum, redeemer, ctx] 10000]
