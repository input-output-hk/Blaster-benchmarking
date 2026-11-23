import LiveScripts.Shared
import LiveScripts.S_fb39ea6bb975ea6de4a2c51572234dc584c89beccc09a49934389e51.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fb39ea6bb975ea6de4a2c51572234dc584c89beccc09a49934389e51.script [redeemer, ctx] 10000]
