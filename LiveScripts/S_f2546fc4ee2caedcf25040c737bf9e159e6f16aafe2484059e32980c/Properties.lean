import LiveScripts.Shared
import LiveScripts.S_f2546fc4ee2caedcf25040c737bf9e159e6f16aafe2484059e32980c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f2546fc4ee2caedcf25040c737bf9e159e6f16aafe2484059e32980c.script [ctx] 10000]
