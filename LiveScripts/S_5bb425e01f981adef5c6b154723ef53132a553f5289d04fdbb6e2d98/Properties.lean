import LiveScripts.Shared
import LiveScripts.S_5bb425e01f981adef5c6b154723ef53132a553f5289d04fdbb6e2d98.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5bb425e01f981adef5c6b154723ef53132a553f5289d04fdbb6e2d98.script [datum, redeemer, ctx] 10000]
