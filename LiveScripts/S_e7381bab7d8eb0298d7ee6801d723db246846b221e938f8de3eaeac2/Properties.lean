import LiveScripts.Shared
import LiveScripts.S_e7381bab7d8eb0298d7ee6801d723db246846b221e938f8de3eaeac2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e7381bab7d8eb0298d7ee6801d723db246846b221e938f8de3eaeac2.script [redeemer, ctx] 10000]
