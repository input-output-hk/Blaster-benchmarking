import LiveScripts.Shared
import LiveScripts.S_bebb904dd907ff87e023f33860f63a0f5c689490cc8331d095054ef0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bebb904dd907ff87e023f33860f63a0f5c689490cc8331d095054ef0.script [datum, redeemer, ctx] 10000]
