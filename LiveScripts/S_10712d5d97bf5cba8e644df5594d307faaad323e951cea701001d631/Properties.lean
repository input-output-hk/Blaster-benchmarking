import LiveScripts.Shared
import LiveScripts.S_10712d5d97bf5cba8e644df5594d307faaad323e951cea701001d631.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10712d5d97bf5cba8e644df5594d307faaad323e951cea701001d631.script [ctx] 10000]
