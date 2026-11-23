import LiveScripts.Shared
import LiveScripts.S_3c6321a2b20b4fb2fd59ed48af617a8d08fa119901e4766298e030de.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3c6321a2b20b4fb2fd59ed48af617a8d08fa119901e4766298e030de.script [datum, redeemer, ctx] 10000]
