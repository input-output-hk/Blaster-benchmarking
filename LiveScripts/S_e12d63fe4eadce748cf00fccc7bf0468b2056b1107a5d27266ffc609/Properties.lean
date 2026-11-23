import LiveScripts.Shared
import LiveScripts.S_e12d63fe4eadce748cf00fccc7bf0468b2056b1107a5d27266ffc609.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e12d63fe4eadce748cf00fccc7bf0468b2056b1107a5d27266ffc609.script [ctx] 10000]
