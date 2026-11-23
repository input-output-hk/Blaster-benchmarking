import LiveScripts.Shared
import LiveScripts.S_c837b39377a5a91d7db60cdc4f4588007ae322538ee03008e7244fc8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c837b39377a5a91d7db60cdc4f4588007ae322538ee03008e7244fc8.script [ctx] 10000]
