import LiveScripts.Shared
import LiveScripts.S_e713f31432992e14d5ff39b04bf16397c31cff86747f458d71e8c600.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e713f31432992e14d5ff39b04bf16397c31cff86747f458d71e8c600.script [datum, redeemer, ctx] 10000]
