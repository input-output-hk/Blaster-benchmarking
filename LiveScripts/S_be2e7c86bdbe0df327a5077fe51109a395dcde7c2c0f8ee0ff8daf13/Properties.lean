import LiveScripts.Shared
import LiveScripts.S_be2e7c86bdbe0df327a5077fe51109a395dcde7c2c0f8ee0ff8daf13.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_be2e7c86bdbe0df327a5077fe51109a395dcde7c2c0f8ee0ff8daf13.script [datum, redeemer, ctx] 10000]
