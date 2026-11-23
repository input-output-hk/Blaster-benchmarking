import LiveScripts.Shared
import LiveScripts.S_a0cd7a570241f3286de80d6898d5b74bddd133295798157648dd9693.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a0cd7a570241f3286de80d6898d5b74bddd133295798157648dd9693.script [ctx] 10000]
