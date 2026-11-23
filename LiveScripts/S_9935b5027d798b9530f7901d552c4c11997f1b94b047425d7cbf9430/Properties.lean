import LiveScripts.Shared
import LiveScripts.S_9935b5027d798b9530f7901d552c4c11997f1b94b047425d7cbf9430.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9935b5027d798b9530f7901d552c4c11997f1b94b047425d7cbf9430.script [ctx] 10000]
