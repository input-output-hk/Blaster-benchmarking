import LiveScripts.Shared
import LiveScripts.S_9e00df0615de0a7b121a7f961d43e23165b8e81b64786c6eb708d370.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9e00df0615de0a7b121a7f961d43e23165b8e81b64786c6eb708d370.script [redeemer, ctx] 10000]
