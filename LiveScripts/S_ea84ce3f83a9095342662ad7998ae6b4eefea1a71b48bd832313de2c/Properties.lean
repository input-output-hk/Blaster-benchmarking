import LiveScripts.Shared
import LiveScripts.S_ea84ce3f83a9095342662ad7998ae6b4eefea1a71b48bd832313de2c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea84ce3f83a9095342662ad7998ae6b4eefea1a71b48bd832313de2c.script [ctx] 10000]
