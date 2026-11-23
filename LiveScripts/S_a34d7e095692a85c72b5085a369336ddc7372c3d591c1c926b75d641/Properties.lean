import LiveScripts.Shared
import LiveScripts.S_a34d7e095692a85c72b5085a369336ddc7372c3d591c1c926b75d641.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a34d7e095692a85c72b5085a369336ddc7372c3d591c1c926b75d641.script [ctx] 10000]
