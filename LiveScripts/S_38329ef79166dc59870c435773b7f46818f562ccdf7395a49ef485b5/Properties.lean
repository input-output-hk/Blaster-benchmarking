import LiveScripts.Shared
import LiveScripts.S_38329ef79166dc59870c435773b7f46818f562ccdf7395a49ef485b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_38329ef79166dc59870c435773b7f46818f562ccdf7395a49ef485b5.script [redeemer, ctx] 10000]
