import LiveScripts.Shared
import LiveScripts.S_96f5c1bee23481335ff4aece32fe1dfa1aa40a944a66d2d6edc9a9a5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_96f5c1bee23481335ff4aece32fe1dfa1aa40a944a66d2d6edc9a9a5.script [redeemer, ctx] 10000]
