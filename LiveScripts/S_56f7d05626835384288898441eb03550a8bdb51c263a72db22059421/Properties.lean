import LiveScripts.Shared
import LiveScripts.S_56f7d05626835384288898441eb03550a8bdb51c263a72db22059421.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_56f7d05626835384288898441eb03550a8bdb51c263a72db22059421.script [ctx] 10000]
