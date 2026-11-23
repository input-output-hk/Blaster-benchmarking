import LiveScripts.Shared
import LiveScripts.S_287d89b5fe9b0a39627ce19ae0426de1a229b8692b3fdd7d9b4daa62.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_287d89b5fe9b0a39627ce19ae0426de1a229b8692b3fdd7d9b4daa62.script [datum, redeemer, ctx] 10000]
