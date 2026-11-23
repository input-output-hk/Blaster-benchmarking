import LiveScripts.Shared
import LiveScripts.S_1415ae7374249a619197376abeac36b7ad110de6dbd0a3eb3d1f7086.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1415ae7374249a619197376abeac36b7ad110de6dbd0a3eb3d1f7086.script [datum, redeemer, ctx] 10000]
