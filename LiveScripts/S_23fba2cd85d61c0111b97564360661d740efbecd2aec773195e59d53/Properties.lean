import LiveScripts.Shared
import LiveScripts.S_23fba2cd85d61c0111b97564360661d740efbecd2aec773195e59d53.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_23fba2cd85d61c0111b97564360661d740efbecd2aec773195e59d53.script [ctx] 10000]
