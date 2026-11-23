import LiveScripts.Shared
import LiveScripts.S_9392bfc154f465f6788192c0176feca44c4b43318585b246712629db.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9392bfc154f465f6788192c0176feca44c4b43318585b246712629db.script [datum, redeemer, ctx] 10000]
