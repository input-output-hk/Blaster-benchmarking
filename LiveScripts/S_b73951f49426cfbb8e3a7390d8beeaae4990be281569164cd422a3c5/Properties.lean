import LiveScripts.Shared
import LiveScripts.S_b73951f49426cfbb8e3a7390d8beeaae4990be281569164cd422a3c5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b73951f49426cfbb8e3a7390d8beeaae4990be281569164cd422a3c5.script [ctx] 10000]
