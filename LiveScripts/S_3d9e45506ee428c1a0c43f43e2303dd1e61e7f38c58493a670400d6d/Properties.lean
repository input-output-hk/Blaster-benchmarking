import LiveScripts.Shared
import LiveScripts.S_3d9e45506ee428c1a0c43f43e2303dd1e61e7f38c58493a670400d6d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3d9e45506ee428c1a0c43f43e2303dd1e61e7f38c58493a670400d6d.script [datum, redeemer, ctx] 10000]
