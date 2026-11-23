import LiveScripts.Shared
import LiveScripts.S_9a899983b90e2c2cfbc985cd34812a1ba393e169d7f7d277085ab14a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9a899983b90e2c2cfbc985cd34812a1ba393e169d7f7d277085ab14a.script [ctx] 10000]
