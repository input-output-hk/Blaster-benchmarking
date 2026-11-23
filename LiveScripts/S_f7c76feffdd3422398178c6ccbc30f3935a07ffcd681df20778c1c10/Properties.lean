import LiveScripts.Shared
import LiveScripts.S_f7c76feffdd3422398178c6ccbc30f3935a07ffcd681df20778c1c10.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f7c76feffdd3422398178c6ccbc30f3935a07ffcd681df20778c1c10.script [datum, redeemer, ctx] 10000]
