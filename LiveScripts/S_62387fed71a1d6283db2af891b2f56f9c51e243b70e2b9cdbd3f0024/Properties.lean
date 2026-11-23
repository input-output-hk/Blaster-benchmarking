import LiveScripts.Shared
import LiveScripts.S_62387fed71a1d6283db2af891b2f56f9c51e243b70e2b9cdbd3f0024.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62387fed71a1d6283db2af891b2f56f9c51e243b70e2b9cdbd3f0024.script [ctx] 10000]
