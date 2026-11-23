import LiveScripts.Shared
import LiveScripts.S_35dbed959db9e534c326d86695a000b71ff89b0e0437f27304e35af4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_35dbed959db9e534c326d86695a000b71ff89b0e0437f27304e35af4.script [datum, redeemer, ctx] 10000]
