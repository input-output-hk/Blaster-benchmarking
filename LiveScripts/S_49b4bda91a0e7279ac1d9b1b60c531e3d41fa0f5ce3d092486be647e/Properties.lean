import LiveScripts.Shared
import LiveScripts.S_49b4bda91a0e7279ac1d9b1b60c531e3d41fa0f5ce3d092486be647e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_49b4bda91a0e7279ac1d9b1b60c531e3d41fa0f5ce3d092486be647e.script [ctx] 10000]
