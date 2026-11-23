import LiveScripts.Shared
import LiveScripts.S_8720dfdeaca7c6061aa2bf2bfa5451a539003729f49008d683a0a486.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8720dfdeaca7c6061aa2bf2bfa5451a539003729f49008d683a0a486.script [ctx] 10000]
