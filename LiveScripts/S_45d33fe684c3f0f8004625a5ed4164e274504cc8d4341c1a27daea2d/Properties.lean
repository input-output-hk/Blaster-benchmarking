import LiveScripts.Shared
import LiveScripts.S_45d33fe684c3f0f8004625a5ed4164e274504cc8d4341c1a27daea2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_45d33fe684c3f0f8004625a5ed4164e274504cc8d4341c1a27daea2d.script [ctx] 10000]
