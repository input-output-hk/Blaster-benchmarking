import LiveScripts.Shared
import LiveScripts.S_80f6d74ed86ebdd6e2faef42bff7d55cc4a30c28df6e60bc9c2d7a21.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_80f6d74ed86ebdd6e2faef42bff7d55cc4a30c28df6e60bc9c2d7a21.script [redeemer, ctx] 10000]
