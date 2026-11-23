import LiveScripts.Shared
import LiveScripts.S_b4f7a70f758c05cdbf5498917ecdaee1fadef4cdff140a8435df81eb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b4f7a70f758c05cdbf5498917ecdaee1fadef4cdff140a8435df81eb.script [datum, redeemer, ctx] 10000]
