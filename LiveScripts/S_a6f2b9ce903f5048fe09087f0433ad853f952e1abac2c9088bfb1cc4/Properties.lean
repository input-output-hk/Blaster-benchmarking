import LiveScripts.Shared
import LiveScripts.S_a6f2b9ce903f5048fe09087f0433ad853f952e1abac2c9088bfb1cc4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a6f2b9ce903f5048fe09087f0433ad853f952e1abac2c9088bfb1cc4.script [ctx] 10000]
