import LiveScripts.Shared
import LiveScripts.S_7c86d665bd9613f1e059930778b707631655794a19c86e86a297eaef.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7c86d665bd9613f1e059930778b707631655794a19c86e86a297eaef.script [datum, redeemer, ctx] 10000]
