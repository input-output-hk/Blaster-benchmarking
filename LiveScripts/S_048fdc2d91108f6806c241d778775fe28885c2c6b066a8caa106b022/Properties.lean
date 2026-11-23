import LiveScripts.Shared
import LiveScripts.S_048fdc2d91108f6806c241d778775fe28885c2c6b066a8caa106b022.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_048fdc2d91108f6806c241d778775fe28885c2c6b066a8caa106b022.script [redeemer, ctx] 10000]
