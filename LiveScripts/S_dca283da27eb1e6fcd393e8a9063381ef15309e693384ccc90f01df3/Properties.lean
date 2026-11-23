import LiveScripts.Shared
import LiveScripts.S_dca283da27eb1e6fcd393e8a9063381ef15309e693384ccc90f01df3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dca283da27eb1e6fcd393e8a9063381ef15309e693384ccc90f01df3.script [ctx] 10000]
