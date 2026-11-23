import LiveScripts.Shared
import LiveScripts.S_488034c5ff5d177408deb3dda546b9a1431e2378536e954796c8db73.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_488034c5ff5d177408deb3dda546b9a1431e2378536e954796c8db73.script [ctx] 10000]
