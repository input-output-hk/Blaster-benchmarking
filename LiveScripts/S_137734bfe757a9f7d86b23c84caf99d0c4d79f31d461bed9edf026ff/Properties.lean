import LiveScripts.Shared
import LiveScripts.S_137734bfe757a9f7d86b23c84caf99d0c4d79f31d461bed9edf026ff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_137734bfe757a9f7d86b23c84caf99d0c4d79f31d461bed9edf026ff.script [ctx] 10000]
