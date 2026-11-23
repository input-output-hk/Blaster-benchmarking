import LiveScripts.Shared
import LiveScripts.S_c4c81721d9c60f154b00abf1ef1b9b5a11e18203d136b95ca0c4f513.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c4c81721d9c60f154b00abf1ef1b9b5a11e18203d136b95ca0c4f513.script [datum, redeemer, ctx] 10000]
