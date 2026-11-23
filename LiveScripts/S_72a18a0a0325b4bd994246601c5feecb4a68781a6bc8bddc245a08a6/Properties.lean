import LiveScripts.Shared
import LiveScripts.S_72a18a0a0325b4bd994246601c5feecb4a68781a6bc8bddc245a08a6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_72a18a0a0325b4bd994246601c5feecb4a68781a6bc8bddc245a08a6.script [ctx] 10000]
