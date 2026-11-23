import LiveScripts.Shared
import LiveScripts.S_baf2317e105856f8a8abeaf9764efae51a48a8c1d1e4ca67dc34553c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_baf2317e105856f8a8abeaf9764efae51a48a8c1d1e4ca67dc34553c.script [ctx] 10000]
