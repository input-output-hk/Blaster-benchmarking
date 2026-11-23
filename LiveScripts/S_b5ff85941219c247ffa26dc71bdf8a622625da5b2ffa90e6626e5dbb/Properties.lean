import LiveScripts.Shared
import LiveScripts.S_b5ff85941219c247ffa26dc71bdf8a622625da5b2ffa90e6626e5dbb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5ff85941219c247ffa26dc71bdf8a622625da5b2ffa90e6626e5dbb.script [datum, redeemer, ctx] 10000]
