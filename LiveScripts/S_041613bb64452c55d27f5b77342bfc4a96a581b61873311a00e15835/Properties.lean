import LiveScripts.Shared
import LiveScripts.S_041613bb64452c55d27f5b77342bfc4a96a581b61873311a00e15835.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_041613bb64452c55d27f5b77342bfc4a96a581b61873311a00e15835.script [ctx] 10000]
