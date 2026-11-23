import LiveScripts.Shared
import LiveScripts.S_33d8e9efc12fc99a8636bdb68d9daff862e4a334f8f071e17f425c3f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_33d8e9efc12fc99a8636bdb68d9daff862e4a334f8f071e17f425c3f.script [datum, redeemer, ctx] 10000]
