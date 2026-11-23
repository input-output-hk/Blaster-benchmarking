import LiveScripts.Shared
import LiveScripts.S_1f2ea2f8f4c86586a9b6354fc8ef2aad609b222a0f85ba804ea02344.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1f2ea2f8f4c86586a9b6354fc8ef2aad609b222a0f85ba804ea02344.script [datum, redeemer, ctx] 10000]
