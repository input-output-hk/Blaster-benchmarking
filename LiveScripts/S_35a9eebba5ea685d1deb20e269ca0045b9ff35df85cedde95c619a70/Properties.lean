import LiveScripts.Shared
import LiveScripts.S_35a9eebba5ea685d1deb20e269ca0045b9ff35df85cedde95c619a70.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_35a9eebba5ea685d1deb20e269ca0045b9ff35df85cedde95c619a70.script [ctx] 10000]
