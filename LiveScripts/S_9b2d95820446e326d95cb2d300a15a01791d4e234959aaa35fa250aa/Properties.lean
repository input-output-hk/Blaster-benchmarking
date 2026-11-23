import LiveScripts.Shared
import LiveScripts.S_9b2d95820446e326d95cb2d300a15a01791d4e234959aaa35fa250aa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b2d95820446e326d95cb2d300a15a01791d4e234959aaa35fa250aa.script [ctx] 10000]
