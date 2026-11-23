import LiveScripts.Shared
import LiveScripts.S_9df68e342d62afa6bf90ff4de98226eebab97f59da13e3a01ca950e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9df68e342d62afa6bf90ff4de98226eebab97f59da13e3a01ca950e8.script [ctx] 10000]
