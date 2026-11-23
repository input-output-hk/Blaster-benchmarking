import LiveScripts.Shared
import LiveScripts.S_5aa58bd5fc28246be3ffcb970461a8d7344b08dfa8ca680e60273e21.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5aa58bd5fc28246be3ffcb970461a8d7344b08dfa8ca680e60273e21.script [ctx] 10000]
