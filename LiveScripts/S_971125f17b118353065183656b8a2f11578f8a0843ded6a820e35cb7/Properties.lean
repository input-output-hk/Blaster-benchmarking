import LiveScripts.Shared
import LiveScripts.S_971125f17b118353065183656b8a2f11578f8a0843ded6a820e35cb7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_971125f17b118353065183656b8a2f11578f8a0843ded6a820e35cb7.script [ctx] 10000]
