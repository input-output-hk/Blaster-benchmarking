import LiveScripts.Shared
import LiveScripts.S_a4864d7e8ceed0e001d5c7df62149c5fb206551862180dc0f7db2bb2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a4864d7e8ceed0e001d5c7df62149c5fb206551862180dc0f7db2bb2.script [redeemer, ctx] 10000]
