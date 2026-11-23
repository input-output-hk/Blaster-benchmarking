import LiveScripts.Shared
import LiveScripts.S_9add544910ae085de9d54ad5a7c2cbabae40a0dee3bf7b3335632f30.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9add544910ae085de9d54ad5a7c2cbabae40a0dee3bf7b3335632f30.script [ctx] 10000]
