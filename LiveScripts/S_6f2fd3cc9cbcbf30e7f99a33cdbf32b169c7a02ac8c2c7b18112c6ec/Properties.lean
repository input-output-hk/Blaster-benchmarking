import LiveScripts.Shared
import LiveScripts.S_6f2fd3cc9cbcbf30e7f99a33cdbf32b169c7a02ac8c2c7b18112c6ec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6f2fd3cc9cbcbf30e7f99a33cdbf32b169c7a02ac8c2c7b18112c6ec.script [ctx] 10000]
