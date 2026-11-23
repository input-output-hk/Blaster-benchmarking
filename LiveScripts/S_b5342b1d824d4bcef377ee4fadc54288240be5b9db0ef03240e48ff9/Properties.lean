import LiveScripts.Shared
import LiveScripts.S_b5342b1d824d4bcef377ee4fadc54288240be5b9db0ef03240e48ff9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5342b1d824d4bcef377ee4fadc54288240be5b9db0ef03240e48ff9.script [ctx] 10000]
