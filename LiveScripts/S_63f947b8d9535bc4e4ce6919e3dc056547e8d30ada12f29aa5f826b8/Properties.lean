import LiveScripts.Shared
import LiveScripts.S_63f947b8d9535bc4e4ce6919e3dc056547e8d30ada12f29aa5f826b8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_63f947b8d9535bc4e4ce6919e3dc056547e8d30ada12f29aa5f826b8.script [redeemer, ctx] 10000]
