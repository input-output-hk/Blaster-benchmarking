import LiveScripts.Shared
import LiveScripts.S_572b0425b5a04e121391a52e6669331e4dbdbfe42293593c3a3618d7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_572b0425b5a04e121391a52e6669331e4dbdbfe42293593c3a3618d7.script [datum, redeemer, ctx] 10000]
