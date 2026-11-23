import LiveScripts.Shared
import LiveScripts.S_ea7a9182e4cf255a9fe7d648d5666e3c9a8c6cff6159b93e56545f2f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea7a9182e4cf255a9fe7d648d5666e3c9a8c6cff6159b93e56545f2f.script [redeemer, ctx] 10000]
