import LiveScripts.Shared
import LiveScripts.S_e2680ee614083811b86c9e2c623fdd724e865c4cdd0905f7b72f9c5e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e2680ee614083811b86c9e2c623fdd724e865c4cdd0905f7b72f9c5e.script [ctx] 10000]
