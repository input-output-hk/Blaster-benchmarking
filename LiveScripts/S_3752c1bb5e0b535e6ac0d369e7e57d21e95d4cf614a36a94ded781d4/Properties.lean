import LiveScripts.Shared
import LiveScripts.S_3752c1bb5e0b535e6ac0d369e7e57d21e95d4cf614a36a94ded781d4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3752c1bb5e0b535e6ac0d369e7e57d21e95d4cf614a36a94ded781d4.script [datum, redeemer, ctx] 10000]
