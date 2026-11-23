import LiveScripts.Shared
import LiveScripts.S_f0edf6f1229ac2706eddaf0b503ce25e2d9ebafb51f4cc41524cdfa1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f0edf6f1229ac2706eddaf0b503ce25e2d9ebafb51f4cc41524cdfa1.script [ctx] 10000]
