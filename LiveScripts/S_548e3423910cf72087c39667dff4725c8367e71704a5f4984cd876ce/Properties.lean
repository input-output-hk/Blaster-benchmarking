import LiveScripts.Shared
import LiveScripts.S_548e3423910cf72087c39667dff4725c8367e71704a5f4984cd876ce.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_548e3423910cf72087c39667dff4725c8367e71704a5f4984cd876ce.script [redeemer, ctx] 10000]
