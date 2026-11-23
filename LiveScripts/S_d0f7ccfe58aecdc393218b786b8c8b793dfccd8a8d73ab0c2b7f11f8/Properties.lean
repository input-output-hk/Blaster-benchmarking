import LiveScripts.Shared
import LiveScripts.S_d0f7ccfe58aecdc393218b786b8c8b793dfccd8a8d73ab0c2b7f11f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d0f7ccfe58aecdc393218b786b8c8b793dfccd8a8d73ab0c2b7f11f8.script [redeemer, ctx] 10000]
