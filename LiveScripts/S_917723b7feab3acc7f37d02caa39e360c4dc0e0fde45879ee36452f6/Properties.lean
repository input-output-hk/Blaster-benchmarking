import LiveScripts.Shared
import LiveScripts.S_917723b7feab3acc7f37d02caa39e360c4dc0e0fde45879ee36452f6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_917723b7feab3acc7f37d02caa39e360c4dc0e0fde45879ee36452f6.script [ctx] 10000]
