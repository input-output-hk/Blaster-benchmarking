import LiveScripts.Shared
import LiveScripts.S_b7fd3205c5f78b3602d691a563a9293394a6b769c28cafabe354882e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b7fd3205c5f78b3602d691a563a9293394a6b769c28cafabe354882e.script [ctx] 10000]
