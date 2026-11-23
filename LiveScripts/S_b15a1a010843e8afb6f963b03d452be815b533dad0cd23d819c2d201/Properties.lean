import LiveScripts.Shared
import LiveScripts.S_b15a1a010843e8afb6f963b03d452be815b533dad0cd23d819c2d201.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b15a1a010843e8afb6f963b03d452be815b533dad0cd23d819c2d201.script [datum, redeemer, ctx] 10000]
