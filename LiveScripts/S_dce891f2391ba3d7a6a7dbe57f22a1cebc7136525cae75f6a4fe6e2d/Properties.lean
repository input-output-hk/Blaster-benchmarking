import LiveScripts.Shared
import LiveScripts.S_dce891f2391ba3d7a6a7dbe57f22a1cebc7136525cae75f6a4fe6e2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dce891f2391ba3d7a6a7dbe57f22a1cebc7136525cae75f6a4fe6e2d.script [redeemer, ctx] 10000]
