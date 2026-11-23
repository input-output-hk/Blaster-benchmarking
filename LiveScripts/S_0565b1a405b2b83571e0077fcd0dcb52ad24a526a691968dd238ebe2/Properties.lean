import LiveScripts.Shared
import LiveScripts.S_0565b1a405b2b83571e0077fcd0dcb52ad24a526a691968dd238ebe2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0565b1a405b2b83571e0077fcd0dcb52ad24a526a691968dd238ebe2.script [datum, redeemer, ctx] 10000]
