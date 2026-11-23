import LiveScripts.Shared
import LiveScripts.S_18501d922ef31d858c9b2ff80a5aec50ad8dd31eadb239057947544e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_18501d922ef31d858c9b2ff80a5aec50ad8dd31eadb239057947544e.script [ctx] 10000]
