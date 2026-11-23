import LiveScripts.Shared
import LiveScripts.S_4e8c49d610335d139ad7711e0f50315006e29b5221da531e365b4ef8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4e8c49d610335d139ad7711e0f50315006e29b5221da531e365b4ef8.script [redeemer, ctx] 10000]
