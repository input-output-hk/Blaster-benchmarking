import LiveScripts.Shared
import LiveScripts.S_d5790406000db18085dacdacbc2837866f05b9c3bbf3c92c60a168bb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d5790406000db18085dacdacbc2837866f05b9c3bbf3c92c60a168bb.script [datum, redeemer, ctx] 10000]
