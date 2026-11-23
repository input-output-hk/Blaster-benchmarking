import LiveScripts.Shared
import LiveScripts.S_06d14ce6923f304037d10821f18de8862fab059a635633bed3462470.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_06d14ce6923f304037d10821f18de8862fab059a635633bed3462470.script [ctx] 10000]
