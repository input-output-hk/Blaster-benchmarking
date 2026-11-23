import LiveScripts.Shared
import LiveScripts.S_4e1bc01061932c4d4692d6205e24f51cdb57feb96a09d39e72467c87.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4e1bc01061932c4d4692d6205e24f51cdb57feb96a09d39e72467c87.script [ctx] 10000]
