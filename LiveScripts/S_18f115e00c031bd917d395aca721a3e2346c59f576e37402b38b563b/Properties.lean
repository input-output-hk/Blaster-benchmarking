import LiveScripts.Shared
import LiveScripts.S_18f115e00c031bd917d395aca721a3e2346c59f576e37402b38b563b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_18f115e00c031bd917d395aca721a3e2346c59f576e37402b38b563b.script [datum, redeemer, ctx] 10000]
