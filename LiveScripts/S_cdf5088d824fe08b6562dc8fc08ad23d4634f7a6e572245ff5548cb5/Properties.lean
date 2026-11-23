import LiveScripts.Shared
import LiveScripts.S_cdf5088d824fe08b6562dc8fc08ad23d4634f7a6e572245ff5548cb5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cdf5088d824fe08b6562dc8fc08ad23d4634f7a6e572245ff5548cb5.script [ctx] 10000]
