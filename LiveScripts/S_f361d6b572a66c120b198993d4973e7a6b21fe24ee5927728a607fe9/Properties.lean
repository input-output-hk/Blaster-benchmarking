import LiveScripts.Shared
import LiveScripts.S_f361d6b572a66c120b198993d4973e7a6b21fe24ee5927728a607fe9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f361d6b572a66c120b198993d4973e7a6b21fe24ee5927728a607fe9.script [ctx] 10000]
