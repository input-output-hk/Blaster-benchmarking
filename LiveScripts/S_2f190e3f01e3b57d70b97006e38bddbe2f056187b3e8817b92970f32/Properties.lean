import LiveScripts.Shared
import LiveScripts.S_2f190e3f01e3b57d70b97006e38bddbe2f056187b3e8817b92970f32.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2f190e3f01e3b57d70b97006e38bddbe2f056187b3e8817b92970f32.script [datum, redeemer, ctx] 10000]
