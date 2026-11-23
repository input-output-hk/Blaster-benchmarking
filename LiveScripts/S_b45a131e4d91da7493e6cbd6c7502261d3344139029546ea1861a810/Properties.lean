import LiveScripts.Shared
import LiveScripts.S_b45a131e4d91da7493e6cbd6c7502261d3344139029546ea1861a810.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b45a131e4d91da7493e6cbd6c7502261d3344139029546ea1861a810.script [ctx] 10000]
