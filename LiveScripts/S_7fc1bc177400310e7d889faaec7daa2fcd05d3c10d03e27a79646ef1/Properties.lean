import LiveScripts.Shared
import LiveScripts.S_7fc1bc177400310e7d889faaec7daa2fcd05d3c10d03e27a79646ef1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7fc1bc177400310e7d889faaec7daa2fcd05d3c10d03e27a79646ef1.script [ctx] 10000]
