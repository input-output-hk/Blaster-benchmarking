import LiveScripts.Shared
import LiveScripts.S_7bed140f3247d05f780d162a542eb5e24c7f94baaf0576e03756cb2c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7bed140f3247d05f780d162a542eb5e24c7f94baaf0576e03756cb2c.script [datum, redeemer, ctx] 10000]
