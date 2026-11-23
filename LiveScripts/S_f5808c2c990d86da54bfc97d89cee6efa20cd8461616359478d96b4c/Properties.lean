import LiveScripts.Shared
import LiveScripts.S_f5808c2c990d86da54bfc97d89cee6efa20cd8461616359478d96b4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f5808c2c990d86da54bfc97d89cee6efa20cd8461616359478d96b4c.script [redeemer, ctx] 10000]
