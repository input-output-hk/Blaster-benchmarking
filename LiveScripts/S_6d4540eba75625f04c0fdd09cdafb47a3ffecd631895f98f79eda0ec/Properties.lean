import LiveScripts.Shared
import LiveScripts.S_6d4540eba75625f04c0fdd09cdafb47a3ffecd631895f98f79eda0ec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d4540eba75625f04c0fdd09cdafb47a3ffecd631895f98f79eda0ec.script [datum, redeemer, ctx] 10000]
