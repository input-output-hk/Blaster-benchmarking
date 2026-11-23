import LiveScripts.Shared
import LiveScripts.S_ba18bb9cff5665770e0516d387e55c7ce404d5167c1a2eb6a5f63dda.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ba18bb9cff5665770e0516d387e55c7ce404d5167c1a2eb6a5f63dda.script [ctx] 10000]
