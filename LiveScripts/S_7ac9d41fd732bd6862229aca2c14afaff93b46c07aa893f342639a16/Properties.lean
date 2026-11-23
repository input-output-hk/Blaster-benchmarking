import LiveScripts.Shared
import LiveScripts.S_7ac9d41fd732bd6862229aca2c14afaff93b46c07aa893f342639a16.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7ac9d41fd732bd6862229aca2c14afaff93b46c07aa893f342639a16.script [ctx] 10000]
