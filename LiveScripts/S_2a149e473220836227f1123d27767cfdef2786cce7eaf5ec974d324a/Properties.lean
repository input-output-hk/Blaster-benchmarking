import LiveScripts.Shared
import LiveScripts.S_2a149e473220836227f1123d27767cfdef2786cce7eaf5ec974d324a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a149e473220836227f1123d27767cfdef2786cce7eaf5ec974d324a.script [datum, redeemer, ctx] 10000]
