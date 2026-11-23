import LiveScripts.Shared
import LiveScripts.S_13e136a43f5f555091e3de719f3c4586012e5b24b82e7976862d3533.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_13e136a43f5f555091e3de719f3c4586012e5b24b82e7976862d3533.script [ctx] 10000]
