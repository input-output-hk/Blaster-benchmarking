import LiveScripts.Shared
import LiveScripts.S_fe548effe20c8d41ed0f14dad715ce359f995cf68bc15cc44f0a4e60.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fe548effe20c8d41ed0f14dad715ce359f995cf68bc15cc44f0a4e60.script [ctx] 10000]
