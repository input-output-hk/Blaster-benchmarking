import LiveScripts.Shared
import LiveScripts.S_863599c87f03bbaed034bf6e36f39fd75b68b1f9bdb65097e0454c13.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_863599c87f03bbaed034bf6e36f39fd75b68b1f9bdb65097e0454c13.script [ctx] 10000]
