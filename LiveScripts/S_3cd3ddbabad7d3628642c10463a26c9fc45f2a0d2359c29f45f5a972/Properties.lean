import LiveScripts.Shared
import LiveScripts.S_3cd3ddbabad7d3628642c10463a26c9fc45f2a0d2359c29f45f5a972.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3cd3ddbabad7d3628642c10463a26c9fc45f2a0d2359c29f45f5a972.script [datum, redeemer, ctx] 10000]
