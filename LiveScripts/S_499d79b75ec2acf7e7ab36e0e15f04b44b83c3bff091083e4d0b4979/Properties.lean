import LiveScripts.Shared
import LiveScripts.S_499d79b75ec2acf7e7ab36e0e15f04b44b83c3bff091083e4d0b4979.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_499d79b75ec2acf7e7ab36e0e15f04b44b83c3bff091083e4d0b4979.script [ctx] 10000]
