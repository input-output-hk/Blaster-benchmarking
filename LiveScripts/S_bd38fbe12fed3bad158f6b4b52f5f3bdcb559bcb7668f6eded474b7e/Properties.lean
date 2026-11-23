import LiveScripts.Shared
import LiveScripts.S_bd38fbe12fed3bad158f6b4b52f5f3bdcb559bcb7668f6eded474b7e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bd38fbe12fed3bad158f6b4b52f5f3bdcb559bcb7668f6eded474b7e.script [ctx] 10000]
