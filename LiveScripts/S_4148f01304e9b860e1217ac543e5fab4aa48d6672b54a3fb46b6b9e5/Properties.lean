import LiveScripts.Shared
import LiveScripts.S_4148f01304e9b860e1217ac543e5fab4aa48d6672b54a3fb46b6b9e5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4148f01304e9b860e1217ac543e5fab4aa48d6672b54a3fb46b6b9e5.script [datum, redeemer, ctx] 10000]
