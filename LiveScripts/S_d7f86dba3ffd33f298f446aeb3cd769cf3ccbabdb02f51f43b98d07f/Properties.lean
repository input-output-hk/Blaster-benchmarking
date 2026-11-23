import LiveScripts.Shared
import LiveScripts.S_d7f86dba3ffd33f298f446aeb3cd769cf3ccbabdb02f51f43b98d07f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d7f86dba3ffd33f298f446aeb3cd769cf3ccbabdb02f51f43b98d07f.script [ctx] 10000]
