import LiveScripts.Shared
import LiveScripts.S_9a08fab2874ddf735391afb34d72b5fc020d34e18247cc6e9aba1f50.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9a08fab2874ddf735391afb34d72b5fc020d34e18247cc6e9aba1f50.script [ctx] 10000]
