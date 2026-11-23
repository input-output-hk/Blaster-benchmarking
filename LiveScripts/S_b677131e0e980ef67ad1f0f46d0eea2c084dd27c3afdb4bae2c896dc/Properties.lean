import LiveScripts.Shared
import LiveScripts.S_b677131e0e980ef67ad1f0f46d0eea2c084dd27c3afdb4bae2c896dc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b677131e0e980ef67ad1f0f46d0eea2c084dd27c3afdb4bae2c896dc.script [ctx] 10000]
