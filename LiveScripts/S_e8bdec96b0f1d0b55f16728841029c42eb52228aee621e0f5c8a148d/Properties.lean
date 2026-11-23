import LiveScripts.Shared
import LiveScripts.S_e8bdec96b0f1d0b55f16728841029c42eb52228aee621e0f5c8a148d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e8bdec96b0f1d0b55f16728841029c42eb52228aee621e0f5c8a148d.script [ctx] 10000]
