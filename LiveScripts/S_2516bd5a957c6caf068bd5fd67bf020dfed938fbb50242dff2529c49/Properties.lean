import LiveScripts.Shared
import LiveScripts.S_2516bd5a957c6caf068bd5fd67bf020dfed938fbb50242dff2529c49.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2516bd5a957c6caf068bd5fd67bf020dfed938fbb50242dff2529c49.script [datum, redeemer, ctx] 10000]
