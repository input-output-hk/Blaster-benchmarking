import LiveScripts.Shared
import LiveScripts.S_84be8657c0f240f63aede90ff4baa456c361af3cf267d7378fad56a1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_84be8657c0f240f63aede90ff4baa456c361af3cf267d7378fad56a1.script [datum, redeemer, ctx] 10000]
