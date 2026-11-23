import LiveScripts.Shared
import LiveScripts.S_45337d367c572a634bc0a616b4c85c9ef7f41aa1bbb20738f2c8a266.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_45337d367c572a634bc0a616b4c85c9ef7f41aa1bbb20738f2c8a266.script [datum, redeemer, ctx] 10000]
