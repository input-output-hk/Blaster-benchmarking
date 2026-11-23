import LiveScripts.Shared
import LiveScripts.S_6563d77a4da81a91831c68d192a3eeefb0340f1341518aae7ce2d48e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6563d77a4da81a91831c68d192a3eeefb0340f1341518aae7ce2d48e.script [datum, redeemer, ctx] 10000]
