import LiveScripts.Shared
import LiveScripts.S_74115afb757a8a349fcb8f04bb9fc39f91b6ae5784bdbe4e56140a43.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_74115afb757a8a349fcb8f04bb9fc39f91b6ae5784bdbe4e56140a43.script [datum, redeemer, ctx] 10000]
