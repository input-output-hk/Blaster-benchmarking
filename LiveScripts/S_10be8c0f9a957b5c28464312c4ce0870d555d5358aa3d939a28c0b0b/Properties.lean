import LiveScripts.Shared
import LiveScripts.S_10be8c0f9a957b5c28464312c4ce0870d555d5358aa3d939a28c0b0b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10be8c0f9a957b5c28464312c4ce0870d555d5358aa3d939a28c0b0b.script [redeemer, ctx] 10000]
