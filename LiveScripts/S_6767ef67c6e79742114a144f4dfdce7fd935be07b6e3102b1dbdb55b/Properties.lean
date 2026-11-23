import LiveScripts.Shared
import LiveScripts.S_6767ef67c6e79742114a144f4dfdce7fd935be07b6e3102b1dbdb55b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6767ef67c6e79742114a144f4dfdce7fd935be07b6e3102b1dbdb55b.script [datum, redeemer, ctx] 10000]
