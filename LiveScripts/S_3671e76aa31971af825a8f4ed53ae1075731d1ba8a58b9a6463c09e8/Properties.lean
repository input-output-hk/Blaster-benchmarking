import LiveScripts.Shared
import LiveScripts.S_3671e76aa31971af825a8f4ed53ae1075731d1ba8a58b9a6463c09e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3671e76aa31971af825a8f4ed53ae1075731d1ba8a58b9a6463c09e8.script [ctx] 10000]
