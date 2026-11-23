import LiveScripts.Shared
import LiveScripts.S_b5ccbfe34c8db483050c070c044d4245743e5360f98c6b7a3b255535.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5ccbfe34c8db483050c070c044d4245743e5360f98c6b7a3b255535.script [ctx] 10000]
