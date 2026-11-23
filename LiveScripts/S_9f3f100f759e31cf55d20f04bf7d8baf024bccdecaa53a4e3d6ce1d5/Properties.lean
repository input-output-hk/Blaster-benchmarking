import LiveScripts.Shared
import LiveScripts.S_9f3f100f759e31cf55d20f04bf7d8baf024bccdecaa53a4e3d6ce1d5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9f3f100f759e31cf55d20f04bf7d8baf024bccdecaa53a4e3d6ce1d5.script [ctx] 10000]
