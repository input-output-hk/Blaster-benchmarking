import LiveScripts.Shared
import LiveScripts.S_8c9a6f740ab823b1b5db94a680c15cdcd4faa3a6222610094d31e652.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8c9a6f740ab823b1b5db94a680c15cdcd4faa3a6222610094d31e652.script [ctx] 10000]
