import LiveScripts.Shared
import LiveScripts.S_7a6d7bb85a5c34ca965da8711f19ed643e19a3946cd4d383f5e849a4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7a6d7bb85a5c34ca965da8711f19ed643e19a3946cd4d383f5e849a4.script [redeemer, ctx] 10000]
