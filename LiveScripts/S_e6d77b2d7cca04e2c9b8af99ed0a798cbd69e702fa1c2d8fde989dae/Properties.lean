import LiveScripts.Shared
import LiveScripts.S_e6d77b2d7cca04e2c9b8af99ed0a798cbd69e702fa1c2d8fde989dae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e6d77b2d7cca04e2c9b8af99ed0a798cbd69e702fa1c2d8fde989dae.script [ctx] 10000]
