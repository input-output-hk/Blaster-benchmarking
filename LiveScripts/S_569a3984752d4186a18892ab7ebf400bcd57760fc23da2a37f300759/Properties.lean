import LiveScripts.Shared
import LiveScripts.S_569a3984752d4186a18892ab7ebf400bcd57760fc23da2a37f300759.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_569a3984752d4186a18892ab7ebf400bcd57760fc23da2a37f300759.script [datum, redeemer, ctx] 10000]
