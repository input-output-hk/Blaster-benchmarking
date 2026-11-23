import LiveScripts.Shared
import LiveScripts.S_0091aad5d3ded01e6c52d6b3b43c02af72104d38d78c72bd280d3190.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0091aad5d3ded01e6c52d6b3b43c02af72104d38d78c72bd280d3190.script [ctx] 10000]
