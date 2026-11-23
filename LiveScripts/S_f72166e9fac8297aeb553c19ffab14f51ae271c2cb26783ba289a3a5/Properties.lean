import LiveScripts.Shared
import LiveScripts.S_f72166e9fac8297aeb553c19ffab14f51ae271c2cb26783ba289a3a5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f72166e9fac8297aeb553c19ffab14f51ae271c2cb26783ba289a3a5.script [redeemer, ctx] 10000]
