import LiveScripts.Shared
import LiveScripts.S_450f83b7a5c0ace79ed0db89c5926d260cb15bb10ebfc57592329500.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_450f83b7a5c0ace79ed0db89c5926d260cb15bb10ebfc57592329500.script [ctx] 10000]
