import LiveScripts.Shared
import LiveScripts.S_3e5528d9a7610aa5459a7deed9d3c1c2ee8b0310fae6642df4c37213.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3e5528d9a7610aa5459a7deed9d3c1c2ee8b0310fae6642df4c37213.script [redeemer, ctx] 10000]
