import LiveScripts.Shared
import LiveScripts.S_491c30ed4defe0940955177b84195e5f3f9a7f559ed377b4346cfd71.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_491c30ed4defe0940955177b84195e5f3f9a7f559ed377b4346cfd71.script [redeemer, ctx] 10000]
