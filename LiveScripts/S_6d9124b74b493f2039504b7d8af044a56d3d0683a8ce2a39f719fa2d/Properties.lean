import LiveScripts.Shared
import LiveScripts.S_6d9124b74b493f2039504b7d8af044a56d3d0683a8ce2a39f719fa2d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d9124b74b493f2039504b7d8af044a56d3d0683a8ce2a39f719fa2d.script [ctx] 10000]
