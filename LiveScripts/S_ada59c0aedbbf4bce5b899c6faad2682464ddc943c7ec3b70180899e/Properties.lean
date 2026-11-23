import LiveScripts.Shared
import LiveScripts.S_ada59c0aedbbf4bce5b899c6faad2682464ddc943c7ec3b70180899e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ada59c0aedbbf4bce5b899c6faad2682464ddc943c7ec3b70180899e.script [redeemer, ctx] 10000]
