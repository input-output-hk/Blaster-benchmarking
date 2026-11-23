import LiveScripts.Shared
import LiveScripts.S_79fbe6cd147453c39f2f38372f2f8a09e2da0b5cfc108939d4aa35ca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_79fbe6cd147453c39f2f38372f2f8a09e2da0b5cfc108939d4aa35ca.script [datum, redeemer, ctx] 10000]
