import LiveScripts.Shared
import LiveScripts.S_89fa3a3ae3ce6b057eb307db464df2ce733efbcdf8a17b0354c124c6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_89fa3a3ae3ce6b057eb307db464df2ce733efbcdf8a17b0354c124c6.script [ctx] 10000]
