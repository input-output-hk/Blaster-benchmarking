import LiveScripts.Shared
import LiveScripts.S_2a51bbab3bd53dcde2245950a77637f03588df6b4a8880b0ec907a7e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a51bbab3bd53dcde2245950a77637f03588df6b4a8880b0ec907a7e.script [ctx] 10000]
