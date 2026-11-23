import LiveScripts.Shared
import LiveScripts.S_e4d38950ece507f25a8f28ff90c757773456dd022fc89455b4df3e9e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e4d38950ece507f25a8f28ff90c757773456dd022fc89455b4df3e9e.script [datum, redeemer, ctx] 10000]
