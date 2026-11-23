import LiveScripts.Shared
import LiveScripts.S_a43be0747089c38da5f7f4cdfc385ffe9902439b41ac4b7a2a04bfc4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a43be0747089c38da5f7f4cdfc385ffe9902439b41ac4b7a2a04bfc4.script [ctx] 10000]
