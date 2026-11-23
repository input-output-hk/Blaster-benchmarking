import LiveScripts.Shared
import LiveScripts.S_c13e42142606c55ec53a8388ce831a889390b529312ed90604c502ba.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c13e42142606c55ec53a8388ce831a889390b529312ed90604c502ba.script [redeemer, ctx] 10000]
