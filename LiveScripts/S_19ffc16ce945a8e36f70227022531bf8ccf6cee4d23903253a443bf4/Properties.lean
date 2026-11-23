import LiveScripts.Shared
import LiveScripts.S_19ffc16ce945a8e36f70227022531bf8ccf6cee4d23903253a443bf4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_19ffc16ce945a8e36f70227022531bf8ccf6cee4d23903253a443bf4.script [datum, redeemer, ctx] 10000]
