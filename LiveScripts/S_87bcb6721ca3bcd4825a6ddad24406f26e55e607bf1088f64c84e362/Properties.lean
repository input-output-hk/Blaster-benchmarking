import LiveScripts.Shared
import LiveScripts.S_87bcb6721ca3bcd4825a6ddad24406f26e55e607bf1088f64c84e362.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_87bcb6721ca3bcd4825a6ddad24406f26e55e607bf1088f64c84e362.script [ctx] 10000]
