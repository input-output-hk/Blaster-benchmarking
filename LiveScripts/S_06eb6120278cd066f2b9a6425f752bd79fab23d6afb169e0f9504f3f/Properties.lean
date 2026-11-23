import LiveScripts.Shared
import LiveScripts.S_06eb6120278cd066f2b9a6425f752bd79fab23d6afb169e0f9504f3f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_06eb6120278cd066f2b9a6425f752bd79fab23d6afb169e0f9504f3f.script [ctx] 10000]
