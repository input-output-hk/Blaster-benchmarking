import LiveScripts.Shared
import LiveScripts.S_bd941a1ecee56b014d965a0a6ca6ba4450a1df4dd1c27029fe11d474.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bd941a1ecee56b014d965a0a6ca6ba4450a1df4dd1c27029fe11d474.script [ctx] 10000]
