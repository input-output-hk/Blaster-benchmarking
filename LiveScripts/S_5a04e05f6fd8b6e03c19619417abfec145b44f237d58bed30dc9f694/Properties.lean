import LiveScripts.Shared
import LiveScripts.S_5a04e05f6fd8b6e03c19619417abfec145b44f237d58bed30dc9f694.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5a04e05f6fd8b6e03c19619417abfec145b44f237d58bed30dc9f694.script [datum, redeemer, ctx] 10000]
