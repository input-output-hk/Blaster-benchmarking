import LiveScripts.Shared
import LiveScripts.S_f0f3d48e73972d9e1242ce54e30b32996ab981fa9ce8a23fb1cf2103.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f0f3d48e73972d9e1242ce54e30b32996ab981fa9ce8a23fb1cf2103.script [ctx] 10000]
