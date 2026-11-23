import LiveScripts.Shared
import LiveScripts.S_23a0b44d24124da51e9acbd93467c83ce255d336f48ce255092e9936.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_23a0b44d24124da51e9acbd93467c83ce255d336f48ce255092e9936.script [datum, redeemer, ctx] 10000]
