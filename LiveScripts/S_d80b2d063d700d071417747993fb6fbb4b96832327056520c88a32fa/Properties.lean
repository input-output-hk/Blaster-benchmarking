import LiveScripts.Shared
import LiveScripts.S_d80b2d063d700d071417747993fb6fbb4b96832327056520c88a32fa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d80b2d063d700d071417747993fb6fbb4b96832327056520c88a32fa.script [ctx] 10000]
