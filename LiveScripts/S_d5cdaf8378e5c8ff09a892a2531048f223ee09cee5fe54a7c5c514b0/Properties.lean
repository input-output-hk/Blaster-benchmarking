import LiveScripts.Shared
import LiveScripts.S_d5cdaf8378e5c8ff09a892a2531048f223ee09cee5fe54a7c5c514b0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d5cdaf8378e5c8ff09a892a2531048f223ee09cee5fe54a7c5c514b0.script [ctx] 10000]
