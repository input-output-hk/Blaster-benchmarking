import LiveScripts.Shared
import LiveScripts.S_a5a0fc3aaa5db4520ec0d7382608c013e956ad56c90350dc4e9d2291.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a5a0fc3aaa5db4520ec0d7382608c013e956ad56c90350dc4e9d2291.script [redeemer, ctx] 10000]
