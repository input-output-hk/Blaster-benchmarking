import LiveScripts.Shared
import LiveScripts.S_d6aae2059baee188f74917493cf7637e679cd219bdfbbf4dcbeb1d0b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d6aae2059baee188f74917493cf7637e679cd219bdfbbf4dcbeb1d0b.script [redeemer, ctx] 10000]
