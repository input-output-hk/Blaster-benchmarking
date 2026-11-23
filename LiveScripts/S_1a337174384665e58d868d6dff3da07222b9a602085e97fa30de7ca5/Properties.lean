import LiveScripts.Shared
import LiveScripts.S_1a337174384665e58d868d6dff3da07222b9a602085e97fa30de7ca5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1a337174384665e58d868d6dff3da07222b9a602085e97fa30de7ca5.script [datum, redeemer, ctx] 10000]
