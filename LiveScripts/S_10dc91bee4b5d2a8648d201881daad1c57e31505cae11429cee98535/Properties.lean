import LiveScripts.Shared
import LiveScripts.S_10dc91bee4b5d2a8648d201881daad1c57e31505cae11429cee98535.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_10dc91bee4b5d2a8648d201881daad1c57e31505cae11429cee98535.script [datum, redeemer, ctx] 10000]
