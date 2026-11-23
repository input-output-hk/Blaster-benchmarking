import LiveScripts.Shared
import LiveScripts.S_63d7e1501efb7dfda4915597658552e1c3e35e6f34cdc74817fad1dc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_63d7e1501efb7dfda4915597658552e1c3e35e6f34cdc74817fad1dc.script [redeemer, ctx] 10000]
