import LiveScripts.Shared
import LiveScripts.S_26c766148f1b79da27ca37cee3e7a8ccf5f1d745fb55a02eb548df93.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_26c766148f1b79da27ca37cee3e7a8ccf5f1d745fb55a02eb548df93.script [datum, redeemer, ctx] 10000]
