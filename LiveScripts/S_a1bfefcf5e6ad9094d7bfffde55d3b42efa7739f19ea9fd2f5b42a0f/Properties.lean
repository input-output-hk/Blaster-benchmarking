import LiveScripts.Shared
import LiveScripts.S_a1bfefcf5e6ad9094d7bfffde55d3b42efa7739f19ea9fd2f5b42a0f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a1bfefcf5e6ad9094d7bfffde55d3b42efa7739f19ea9fd2f5b42a0f.script [ctx] 10000]
