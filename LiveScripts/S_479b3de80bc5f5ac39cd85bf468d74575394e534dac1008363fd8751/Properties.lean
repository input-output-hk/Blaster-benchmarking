import LiveScripts.Shared
import LiveScripts.S_479b3de80bc5f5ac39cd85bf468d74575394e534dac1008363fd8751.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_479b3de80bc5f5ac39cd85bf468d74575394e534dac1008363fd8751.script [redeemer, ctx] 10000]
