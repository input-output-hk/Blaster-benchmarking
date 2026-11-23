import LiveScripts.Shared
import LiveScripts.S_d97da4f3f2c3757971332b9bfb3c46df18715b059e6ab0fe66ddb036.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d97da4f3f2c3757971332b9bfb3c46df18715b059e6ab0fe66ddb036.script [ctx] 10000]
