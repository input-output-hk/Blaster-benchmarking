import LiveScripts.Shared
import LiveScripts.S_9b19b4882da7b268b323bca774a8489b03dc12c39c7d85648cf1356c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9b19b4882da7b268b323bca774a8489b03dc12c39c7d85648cf1356c.script [ctx] 10000]
