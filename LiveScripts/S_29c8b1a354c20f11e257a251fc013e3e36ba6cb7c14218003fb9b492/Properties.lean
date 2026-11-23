import LiveScripts.Shared
import LiveScripts.S_29c8b1a354c20f11e257a251fc013e3e36ba6cb7c14218003fb9b492.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_29c8b1a354c20f11e257a251fc013e3e36ba6cb7c14218003fb9b492.script [ctx] 10000]
