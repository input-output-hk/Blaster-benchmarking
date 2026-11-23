import LiveScripts.Shared
import LiveScripts.S_7a4d45e6b4e6835c4cea3968f291fab3704949cfd2f2dc1997c4eeec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7a4d45e6b4e6835c4cea3968f291fab3704949cfd2f2dc1997c4eeec.script [redeemer, ctx] 10000]
