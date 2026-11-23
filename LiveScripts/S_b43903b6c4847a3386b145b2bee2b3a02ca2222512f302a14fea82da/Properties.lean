import LiveScripts.Shared
import LiveScripts.S_b43903b6c4847a3386b145b2bee2b3a02ca2222512f302a14fea82da.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b43903b6c4847a3386b145b2bee2b3a02ca2222512f302a14fea82da.script [ctx] 10000]
