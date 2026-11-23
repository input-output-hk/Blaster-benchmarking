import LiveScripts.Shared
import LiveScripts.S_61e6ce9bced774364b9eb3f448e626a8a532469914ff0e0aedfef37c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_61e6ce9bced774364b9eb3f448e626a8a532469914ff0e0aedfef37c.script [ctx] 10000]
