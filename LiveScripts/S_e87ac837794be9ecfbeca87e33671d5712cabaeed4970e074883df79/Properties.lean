import LiveScripts.Shared
import LiveScripts.S_e87ac837794be9ecfbeca87e33671d5712cabaeed4970e074883df79.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e87ac837794be9ecfbeca87e33671d5712cabaeed4970e074883df79.script [ctx] 10000]
