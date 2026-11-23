import LiveScripts.Shared
import LiveScripts.S_2e1202db1de018a05aa0e2bdcf963f3332b5f90607be34840ce7470e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2e1202db1de018a05aa0e2bdcf963f3332b5f90607be34840ce7470e.script [redeemer, ctx] 10000]
