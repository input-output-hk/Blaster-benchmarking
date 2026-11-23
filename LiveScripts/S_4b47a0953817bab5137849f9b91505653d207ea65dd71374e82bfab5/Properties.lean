import LiveScripts.Shared
import LiveScripts.S_4b47a0953817bab5137849f9b91505653d207ea65dd71374e82bfab5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4b47a0953817bab5137849f9b91505653d207ea65dd71374e82bfab5.script [redeemer, ctx] 10000]
