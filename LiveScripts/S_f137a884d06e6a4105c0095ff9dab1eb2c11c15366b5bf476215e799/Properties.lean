import LiveScripts.Shared
import LiveScripts.S_f137a884d06e6a4105c0095ff9dab1eb2c11c15366b5bf476215e799.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f137a884d06e6a4105c0095ff9dab1eb2c11c15366b5bf476215e799.script [ctx] 10000]
