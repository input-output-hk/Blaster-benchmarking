import LiveScripts.Shared
import LiveScripts.S_0fc164325f3c710c5b5997ec98c1236d8976875a67cc0de573660881.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0fc164325f3c710c5b5997ec98c1236d8976875a67cc0de573660881.script [ctx] 10000]
