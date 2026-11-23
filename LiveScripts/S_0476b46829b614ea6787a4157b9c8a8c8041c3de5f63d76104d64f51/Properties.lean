import LiveScripts.Shared
import LiveScripts.S_0476b46829b614ea6787a4157b9c8a8c8041c3de5f63d76104d64f51.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0476b46829b614ea6787a4157b9c8a8c8041c3de5f63d76104d64f51.script [ctx] 10000]
