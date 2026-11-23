import LiveScripts.Shared
import LiveScripts.S_36ac382805de54081e26a9f71c3974f8d98695998c169b60acd97a59.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_36ac382805de54081e26a9f71c3974f8d98695998c169b60acd97a59.script [redeemer, ctx] 10000]
