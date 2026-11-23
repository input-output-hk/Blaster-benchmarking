import LiveScripts.Shared
import LiveScripts.S_8670b6b936296a20014de4b786897a44652d273a97c498f35c69d7d0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8670b6b936296a20014de4b786897a44652d273a97c498f35c69d7d0.script [ctx] 10000]
