import LiveScripts.Shared
import LiveScripts.S_3883e3e6a24e092d4c14e757fa8ef5c887853060def087d6cf5603f5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3883e3e6a24e092d4c14e757fa8ef5c887853060def087d6cf5603f5.script [redeemer, ctx] 10000]
