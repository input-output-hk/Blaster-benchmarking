import LiveScripts.Shared
import LiveScripts.S_994c728861aec764b14693d2bd34d2586515d8a88ba16059df2e0276.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_994c728861aec764b14693d2bd34d2586515d8a88ba16059df2e0276.script [ctx] 10000]
