import LiveScripts.Shared
import LiveScripts.S_3d9e3b63e673f56536e2df178777e05b0ae3e20a0aa3854a5a390a10.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3d9e3b63e673f56536e2df178777e05b0ae3e20a0aa3854a5a390a10.script [ctx] 10000]
