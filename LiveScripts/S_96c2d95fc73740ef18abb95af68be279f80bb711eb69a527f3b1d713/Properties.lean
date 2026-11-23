import LiveScripts.Shared
import LiveScripts.S_96c2d95fc73740ef18abb95af68be279f80bb711eb69a527f3b1d713.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_96c2d95fc73740ef18abb95af68be279f80bb711eb69a527f3b1d713.script [datum, redeemer, ctx] 10000]
