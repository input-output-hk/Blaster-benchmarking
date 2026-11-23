import LiveScripts.Shared
import LiveScripts.S_d7d79bc5edff9564fdcdda1ac2e7518c1af6ce5f8c61621396454792.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d7d79bc5edff9564fdcdda1ac2e7518c1af6ce5f8c61621396454792.script [ctx] 10000]
