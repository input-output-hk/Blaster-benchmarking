import LiveScripts.Shared
import LiveScripts.S_0e7d0058dc6afc56799db6f7aac3dcc2fe4220891bf58e2e926e15f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0e7d0058dc6afc56799db6f7aac3dcc2fe4220891bf58e2e926e15f8.script [redeemer, ctx] 10000]
