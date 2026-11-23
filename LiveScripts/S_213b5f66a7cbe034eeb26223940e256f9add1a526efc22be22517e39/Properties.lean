import LiveScripts.Shared
import LiveScripts.S_213b5f66a7cbe034eeb26223940e256f9add1a526efc22be22517e39.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_213b5f66a7cbe034eeb26223940e256f9add1a526efc22be22517e39.script [redeemer, ctx] 10000]
