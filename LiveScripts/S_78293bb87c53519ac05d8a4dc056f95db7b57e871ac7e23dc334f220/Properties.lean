import LiveScripts.Shared
import LiveScripts.S_78293bb87c53519ac05d8a4dc056f95db7b57e871ac7e23dc334f220.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78293bb87c53519ac05d8a4dc056f95db7b57e871ac7e23dc334f220.script [ctx] 10000]
