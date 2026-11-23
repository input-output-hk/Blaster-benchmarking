import LiveScripts.Shared
import LiveScripts.S_fa8b2ff1f7d6797e5fa792bef2d32716772b339c044b4c4de3c23644.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fa8b2ff1f7d6797e5fa792bef2d32716772b339c044b4c4de3c23644.script [ctx] 10000]
