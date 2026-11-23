import LiveScripts.Shared
import LiveScripts.S_4cb907af98c1ed5ee9f251691a0ec909f2a26b583ed271f2a88a55cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4cb907af98c1ed5ee9f251691a0ec909f2a26b583ed271f2a88a55cb.script [ctx] 10000]
