import LiveScripts.Shared
import LiveScripts.S_66e711a4bf9ddf46ff239143870b6893055a4fd4dea9f99fed6665cd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_66e711a4bf9ddf46ff239143870b6893055a4fd4dea9f99fed6665cd.script [redeemer, ctx] 10000]
