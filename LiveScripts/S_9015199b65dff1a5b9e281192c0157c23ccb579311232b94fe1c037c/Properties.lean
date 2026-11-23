import LiveScripts.Shared
import LiveScripts.S_9015199b65dff1a5b9e281192c0157c23ccb579311232b94fe1c037c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9015199b65dff1a5b9e281192c0157c23ccb579311232b94fe1c037c.script [ctx] 10000]
