import LiveScripts.Shared
import LiveScripts.S_5ceb6978a8e770484822a795114709d7c9c3a3287787960cb1d67f57.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ceb6978a8e770484822a795114709d7c9c3a3287787960cb1d67f57.script [datum, redeemer, ctx] 10000]
