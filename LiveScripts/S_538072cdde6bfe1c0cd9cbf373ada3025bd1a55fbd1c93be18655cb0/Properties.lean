import LiveScripts.Shared
import LiveScripts.S_538072cdde6bfe1c0cd9cbf373ada3025bd1a55fbd1c93be18655cb0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_538072cdde6bfe1c0cd9cbf373ada3025bd1a55fbd1c93be18655cb0.script [ctx] 10000]
