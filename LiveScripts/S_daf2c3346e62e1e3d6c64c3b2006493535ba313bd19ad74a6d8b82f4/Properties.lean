import LiveScripts.Shared
import LiveScripts.S_daf2c3346e62e1e3d6c64c3b2006493535ba313bd19ad74a6d8b82f4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_daf2c3346e62e1e3d6c64c3b2006493535ba313bd19ad74a6d8b82f4.script [ctx] 10000]
