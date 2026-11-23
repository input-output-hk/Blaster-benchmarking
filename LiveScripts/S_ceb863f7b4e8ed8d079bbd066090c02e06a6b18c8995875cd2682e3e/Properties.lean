import LiveScripts.Shared
import LiveScripts.S_ceb863f7b4e8ed8d079bbd066090c02e06a6b18c8995875cd2682e3e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ceb863f7b4e8ed8d079bbd066090c02e06a6b18c8995875cd2682e3e.script [datum, redeemer, ctx] 10000]
