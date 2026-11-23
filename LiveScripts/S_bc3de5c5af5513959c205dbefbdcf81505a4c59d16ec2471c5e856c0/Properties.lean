import LiveScripts.Shared
import LiveScripts.S_bc3de5c5af5513959c205dbefbdcf81505a4c59d16ec2471c5e856c0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bc3de5c5af5513959c205dbefbdcf81505a4c59d16ec2471c5e856c0.script [datum, redeemer, ctx] 10000]
