import LiveScripts.Shared
import LiveScripts.S_62a7bf6edc649005d86d63853c8f0b8f750583c00d8767190f73c72e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62a7bf6edc649005d86d63853c8f0b8f750583c00d8767190f73c72e.script [ctx] 10000]
