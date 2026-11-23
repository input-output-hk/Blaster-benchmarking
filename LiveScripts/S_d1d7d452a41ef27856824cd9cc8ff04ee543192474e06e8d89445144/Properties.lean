import LiveScripts.Shared
import LiveScripts.S_d1d7d452a41ef27856824cd9cc8ff04ee543192474e06e8d89445144.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d1d7d452a41ef27856824cd9cc8ff04ee543192474e06e8d89445144.script [redeemer, ctx] 10000]
