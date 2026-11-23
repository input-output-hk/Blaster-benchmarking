import LiveScripts.Shared
import LiveScripts.S_26a8cd75574c11bf33e85e69134529f765cf1e1743d33e89b61da9c5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_26a8cd75574c11bf33e85e69134529f765cf1e1743d33e89b61da9c5.script [ctx] 10000]
