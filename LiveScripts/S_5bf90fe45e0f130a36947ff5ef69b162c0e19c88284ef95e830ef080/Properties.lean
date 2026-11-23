import LiveScripts.Shared
import LiveScripts.S_5bf90fe45e0f130a36947ff5ef69b162c0e19c88284ef95e830ef080.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5bf90fe45e0f130a36947ff5ef69b162c0e19c88284ef95e830ef080.script [datum, redeemer, ctx] 10000]
