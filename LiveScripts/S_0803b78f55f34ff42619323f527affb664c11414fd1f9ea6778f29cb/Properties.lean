import LiveScripts.Shared
import LiveScripts.S_0803b78f55f34ff42619323f527affb664c11414fd1f9ea6778f29cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0803b78f55f34ff42619323f527affb664c11414fd1f9ea6778f29cb.script [ctx] 10000]
