import LiveScripts.Shared
import LiveScripts.S_8b53219504cd47ad9c9fb928bb58847d4683b6a6ed9f341340347cdc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8b53219504cd47ad9c9fb928bb58847d4683b6a6ed9f341340347cdc.script [ctx] 10000]
