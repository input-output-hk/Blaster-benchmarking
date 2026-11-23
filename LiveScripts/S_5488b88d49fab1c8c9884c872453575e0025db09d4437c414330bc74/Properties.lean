import LiveScripts.Shared
import LiveScripts.S_5488b88d49fab1c8c9884c872453575e0025db09d4437c414330bc74.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5488b88d49fab1c8c9884c872453575e0025db09d4437c414330bc74.script [datum, redeemer, ctx] 10000]
