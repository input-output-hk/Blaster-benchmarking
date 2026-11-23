import LiveScripts.Shared
import LiveScripts.S_6c84239f9f36759de3d33d095160bc9ecfa2450ce356bd211592c895.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6c84239f9f36759de3d33d095160bc9ecfa2450ce356bd211592c895.script [ctx] 10000]
