import LiveScripts.Shared
import LiveScripts.S_b970b3e0e1b591840627e6919898c12ee57e2f0225ab03e056d10d52.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b970b3e0e1b591840627e6919898c12ee57e2f0225ab03e056d10d52.script [datum, redeemer, ctx] 10000]
