import LiveScripts.Shared
import LiveScripts.S_4b48b23b2515c13d23bc1cd016f077681e20ebe23172206260e19dbf.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4b48b23b2515c13d23bc1cd016f077681e20ebe23172206260e19dbf.script [ctx] 10000]
