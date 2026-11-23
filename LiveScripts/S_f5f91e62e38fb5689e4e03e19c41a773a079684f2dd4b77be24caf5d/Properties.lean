import LiveScripts.Shared
import LiveScripts.S_f5f91e62e38fb5689e4e03e19c41a773a079684f2dd4b77be24caf5d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f5f91e62e38fb5689e4e03e19c41a773a079684f2dd4b77be24caf5d.script [redeemer, ctx] 10000]
