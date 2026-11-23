import LiveScripts.Shared
import LiveScripts.S_1c477d0c2440a9743a593b113e222fad9344327cd1d1ea3a207659d4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1c477d0c2440a9743a593b113e222fad9344327cd1d1ea3a207659d4.script [datum, redeemer, ctx] 10000]
