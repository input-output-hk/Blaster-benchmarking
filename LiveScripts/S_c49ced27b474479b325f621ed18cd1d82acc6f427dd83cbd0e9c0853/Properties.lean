import LiveScripts.Shared
import LiveScripts.S_c49ced27b474479b325f621ed18cd1d82acc6f427dd83cbd0e9c0853.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c49ced27b474479b325f621ed18cd1d82acc6f427dd83cbd0e9c0853.script [ctx] 10000]
