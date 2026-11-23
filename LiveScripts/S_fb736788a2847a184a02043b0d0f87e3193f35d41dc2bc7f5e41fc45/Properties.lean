import LiveScripts.Shared
import LiveScripts.S_fb736788a2847a184a02043b0d0f87e3193f35d41dc2bc7f5e41fc45.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fb736788a2847a184a02043b0d0f87e3193f35d41dc2bc7f5e41fc45.script [ctx] 10000]
