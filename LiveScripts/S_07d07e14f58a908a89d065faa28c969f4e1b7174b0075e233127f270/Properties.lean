import LiveScripts.Shared
import LiveScripts.S_07d07e14f58a908a89d065faa28c969f4e1b7174b0075e233127f270.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_07d07e14f58a908a89d065faa28c969f4e1b7174b0075e233127f270.script [ctx] 10000]
