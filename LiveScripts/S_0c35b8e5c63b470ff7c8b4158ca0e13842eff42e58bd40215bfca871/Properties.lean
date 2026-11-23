import LiveScripts.Shared
import LiveScripts.S_0c35b8e5c63b470ff7c8b4158ca0e13842eff42e58bd40215bfca871.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0c35b8e5c63b470ff7c8b4158ca0e13842eff42e58bd40215bfca871.script [datum, redeemer, ctx] 10000]
