import LiveScripts.Shared
import LiveScripts.S_b5aaa857932d5e4d660593e24c4ba8f23d71628f9ffc03b47d29e075.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5aaa857932d5e4d660593e24c4ba8f23d71628f9ffc03b47d29e075.script [ctx] 10000]
