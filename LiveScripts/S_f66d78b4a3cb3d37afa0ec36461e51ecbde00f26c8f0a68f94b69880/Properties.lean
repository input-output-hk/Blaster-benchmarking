import LiveScripts.Shared
import LiveScripts.S_f66d78b4a3cb3d37afa0ec36461e51ecbde00f26c8f0a68f94b69880.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f66d78b4a3cb3d37afa0ec36461e51ecbde00f26c8f0a68f94b69880.script [redeemer, ctx] 10000]
