import LiveScripts.Shared
import LiveScripts.S_39ebbab13957b6e92701571ceb18e374251f295ec7940e7b47b3611e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_39ebbab13957b6e92701571ceb18e374251f295ec7940e7b47b3611e.script [ctx] 10000]
