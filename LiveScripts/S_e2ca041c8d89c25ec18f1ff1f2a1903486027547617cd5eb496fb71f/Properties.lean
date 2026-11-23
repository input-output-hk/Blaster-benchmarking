import LiveScripts.Shared
import LiveScripts.S_e2ca041c8d89c25ec18f1ff1f2a1903486027547617cd5eb496fb71f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e2ca041c8d89c25ec18f1ff1f2a1903486027547617cd5eb496fb71f.script [datum, redeemer, ctx] 10000]
