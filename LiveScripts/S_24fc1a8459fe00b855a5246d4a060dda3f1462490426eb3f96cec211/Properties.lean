import LiveScripts.Shared
import LiveScripts.S_24fc1a8459fe00b855a5246d4a060dda3f1462490426eb3f96cec211.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_24fc1a8459fe00b855a5246d4a060dda3f1462490426eb3f96cec211.script [ctx] 10000]
