import LiveScripts.Shared
import LiveScripts.S_f7ba0c0692fcf462884cfa0936604fccf841c819905d60d9e9e60cf1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f7ba0c0692fcf462884cfa0936604fccf841c819905d60d9e9e60cf1.script [datum, redeemer, ctx] 10000]
