import LiveScripts.Shared
import LiveScripts.S_78c79ef406db001785570330800a325e9d64a6e59e9a764a3da2bf3c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78c79ef406db001785570330800a325e9d64a6e59e9a764a3da2bf3c.script [ctx] 10000]
