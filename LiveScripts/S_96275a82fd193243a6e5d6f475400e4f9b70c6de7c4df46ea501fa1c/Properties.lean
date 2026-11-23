import LiveScripts.Shared
import LiveScripts.S_96275a82fd193243a6e5d6f475400e4f9b70c6de7c4df46ea501fa1c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_96275a82fd193243a6e5d6f475400e4f9b70c6de7c4df46ea501fa1c.script [ctx] 10000]
