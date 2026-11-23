import LiveScripts.Shared
import LiveScripts.S_0928984ed4ce5b6cd17094544a5b9e33f7e4c0169948624dd4fb29f2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0928984ed4ce5b6cd17094544a5b9e33f7e4c0169948624dd4fb29f2.script [redeemer, ctx] 10000]
