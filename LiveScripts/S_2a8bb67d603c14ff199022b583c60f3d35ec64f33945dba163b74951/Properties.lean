import LiveScripts.Shared
import LiveScripts.S_2a8bb67d603c14ff199022b583c60f3d35ec64f33945dba163b74951.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a8bb67d603c14ff199022b583c60f3d35ec64f33945dba163b74951.script [datum, redeemer, ctx] 10000]
