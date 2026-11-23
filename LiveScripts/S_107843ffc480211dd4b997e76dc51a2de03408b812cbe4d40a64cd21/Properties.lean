import LiveScripts.Shared
import LiveScripts.S_107843ffc480211dd4b997e76dc51a2de03408b812cbe4d40a64cd21.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_107843ffc480211dd4b997e76dc51a2de03408b812cbe4d40a64cd21.script [ctx] 10000]
