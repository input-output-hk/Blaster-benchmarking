import LiveScripts.Shared
import LiveScripts.S_8a17ded1e2668055285788cebe259e21e46844dc082103e4a7a1df17.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8a17ded1e2668055285788cebe259e21e46844dc082103e4a7a1df17.script [ctx] 10000]
