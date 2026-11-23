import LiveScripts.Shared
import LiveScripts.S_b4422e8bd05b7e59e261a9a67ce055192ece06ccf1df930cd14a9697.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b4422e8bd05b7e59e261a9a67ce055192ece06ccf1df930cd14a9697.script [ctx] 10000]
