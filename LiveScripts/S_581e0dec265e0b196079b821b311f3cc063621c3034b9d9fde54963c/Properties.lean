import LiveScripts.Shared
import LiveScripts.S_581e0dec265e0b196079b821b311f3cc063621c3034b9d9fde54963c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_581e0dec265e0b196079b821b311f3cc063621c3034b9d9fde54963c.script [ctx] 10000]
