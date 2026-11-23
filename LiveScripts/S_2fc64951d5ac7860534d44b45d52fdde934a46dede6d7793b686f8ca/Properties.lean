import LiveScripts.Shared
import LiveScripts.S_2fc64951d5ac7860534d44b45d52fdde934a46dede6d7793b686f8ca.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2fc64951d5ac7860534d44b45d52fdde934a46dede6d7793b686f8ca.script [ctx] 10000]
