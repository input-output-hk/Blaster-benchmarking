import LiveScripts.Shared
import LiveScripts.S_fc8787790a71e54cdd00e6e49265bb977f30aa0618fb4c2ab8817c66.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fc8787790a71e54cdd00e6e49265bb977f30aa0618fb4c2ab8817c66.script [ctx] 10000]
