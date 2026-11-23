import LiveScripts.Shared
import LiveScripts.S_2d066c461f37f3a41d2b2e57df0bff04cdf1ac799d06cb103f685ff2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d066c461f37f3a41d2b2e57df0bff04cdf1ac799d06cb103f685ff2.script [ctx] 10000]
