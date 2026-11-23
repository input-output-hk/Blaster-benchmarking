import LiveScripts.Shared
import LiveScripts.S_b8c990d0457699104e2401c07e07cf58c7d0da4d5a6e915f3c940d26.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b8c990d0457699104e2401c07e07cf58c7d0da4d5a6e915f3c940d26.script [ctx] 10000]
