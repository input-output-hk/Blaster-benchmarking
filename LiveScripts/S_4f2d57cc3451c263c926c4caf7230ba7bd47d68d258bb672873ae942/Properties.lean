import LiveScripts.Shared
import LiveScripts.S_4f2d57cc3451c263c926c4caf7230ba7bd47d68d258bb672873ae942.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4f2d57cc3451c263c926c4caf7230ba7bd47d68d258bb672873ae942.script [ctx] 10000]
