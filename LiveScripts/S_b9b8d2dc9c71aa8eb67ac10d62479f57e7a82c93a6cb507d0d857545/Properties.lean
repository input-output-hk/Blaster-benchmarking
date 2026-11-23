import LiveScripts.Shared
import LiveScripts.S_b9b8d2dc9c71aa8eb67ac10d62479f57e7a82c93a6cb507d0d857545.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b9b8d2dc9c71aa8eb67ac10d62479f57e7a82c93a6cb507d0d857545.script [ctx] 10000]
