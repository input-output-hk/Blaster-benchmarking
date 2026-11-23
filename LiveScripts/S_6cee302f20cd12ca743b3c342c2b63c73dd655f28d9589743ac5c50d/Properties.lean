import LiveScripts.Shared
import LiveScripts.S_6cee302f20cd12ca743b3c342c2b63c73dd655f28d9589743ac5c50d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6cee302f20cd12ca743b3c342c2b63c73dd655f28d9589743ac5c50d.script [ctx] 10000]
