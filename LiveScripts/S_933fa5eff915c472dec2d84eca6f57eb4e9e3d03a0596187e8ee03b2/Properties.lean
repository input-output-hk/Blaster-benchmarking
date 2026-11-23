import LiveScripts.Shared
import LiveScripts.S_933fa5eff915c472dec2d84eca6f57eb4e9e3d03a0596187e8ee03b2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_933fa5eff915c472dec2d84eca6f57eb4e9e3d03a0596187e8ee03b2.script [datum, redeemer, ctx] 10000]
