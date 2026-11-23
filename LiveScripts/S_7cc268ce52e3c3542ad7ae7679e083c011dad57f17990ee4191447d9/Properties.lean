import LiveScripts.Shared
import LiveScripts.S_7cc268ce52e3c3542ad7ae7679e083c011dad57f17990ee4191447d9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7cc268ce52e3c3542ad7ae7679e083c011dad57f17990ee4191447d9.script [ctx] 10000]
