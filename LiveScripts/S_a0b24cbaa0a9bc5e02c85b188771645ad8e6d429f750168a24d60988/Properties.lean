import LiveScripts.Shared
import LiveScripts.S_a0b24cbaa0a9bc5e02c85b188771645ad8e6d429f750168a24d60988.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a0b24cbaa0a9bc5e02c85b188771645ad8e6d429f750168a24d60988.script [ctx] 10000]
