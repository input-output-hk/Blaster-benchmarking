import LiveScripts.Shared
import LiveScripts.S_48bca8aceae8f2742fa6a6511e01cc9b210b083ef74dfb3562e852b8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_48bca8aceae8f2742fa6a6511e01cc9b210b083ef74dfb3562e852b8.script [datum, redeemer, ctx] 10000]
