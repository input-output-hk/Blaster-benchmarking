import LiveScripts.Shared
import LiveScripts.S_d286852a18c225ed1e2fdd86b760ba345505900100c1a6f024f6bcd4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d286852a18c225ed1e2fdd86b760ba345505900100c1a6f024f6bcd4.script [ctx] 10000]
