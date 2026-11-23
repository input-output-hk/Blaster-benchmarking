import LiveScripts.Shared
import LiveScripts.S_2b65d307c0341d9bea9b7081d9b4f5da5e7be92f94461ce26db7b218.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2b65d307c0341d9bea9b7081d9b4f5da5e7be92f94461ce26db7b218.script [ctx] 10000]
