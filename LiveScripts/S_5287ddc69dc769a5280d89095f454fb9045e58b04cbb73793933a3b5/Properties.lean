import LiveScripts.Shared
import LiveScripts.S_5287ddc69dc769a5280d89095f454fb9045e58b04cbb73793933a3b5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5287ddc69dc769a5280d89095f454fb9045e58b04cbb73793933a3b5.script [ctx] 10000]
