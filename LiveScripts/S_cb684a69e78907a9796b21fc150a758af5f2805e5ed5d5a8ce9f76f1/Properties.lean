import LiveScripts.Shared
import LiveScripts.S_cb684a69e78907a9796b21fc150a758af5f2805e5ed5d5a8ce9f76f1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cb684a69e78907a9796b21fc150a758af5f2805e5ed5d5a8ce9f76f1.script [datum, redeemer, ctx] 10000]
