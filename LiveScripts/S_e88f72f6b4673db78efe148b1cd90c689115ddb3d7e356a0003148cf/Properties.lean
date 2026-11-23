import LiveScripts.Shared
import LiveScripts.S_e88f72f6b4673db78efe148b1cd90c689115ddb3d7e356a0003148cf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e88f72f6b4673db78efe148b1cd90c689115ddb3d7e356a0003148cf.script [datum, redeemer, ctx] 10000]
