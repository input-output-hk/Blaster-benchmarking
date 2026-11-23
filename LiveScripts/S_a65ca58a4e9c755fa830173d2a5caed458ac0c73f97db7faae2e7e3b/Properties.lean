import LiveScripts.Shared
import LiveScripts.S_a65ca58a4e9c755fa830173d2a5caed458ac0c73f97db7faae2e7e3b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a65ca58a4e9c755fa830173d2a5caed458ac0c73f97db7faae2e7e3b.script [datum, redeemer, ctx] 10000]
