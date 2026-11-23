import LiveScripts.Shared
import LiveScripts.S_ee04c6d0caad5c7dba3514aa8a9cc125fc709edccb2e9330f18a0c8e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ee04c6d0caad5c7dba3514aa8a9cc125fc709edccb2e9330f18a0c8e.script [datum, redeemer, ctx] 10000]
