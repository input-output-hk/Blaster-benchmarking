import LiveScripts.Shared
import LiveScripts.S_6e9f5fe968d6a1166f1a95d16c13a8e776517e3431ccb924c571602e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e9f5fe968d6a1166f1a95d16c13a8e776517e3431ccb924c571602e.script [ctx] 10000]
