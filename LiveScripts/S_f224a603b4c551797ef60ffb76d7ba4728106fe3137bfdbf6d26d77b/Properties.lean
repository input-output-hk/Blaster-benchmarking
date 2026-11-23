import LiveScripts.Shared
import LiveScripts.S_f224a603b4c551797ef60ffb76d7ba4728106fe3137bfdbf6d26d77b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f224a603b4c551797ef60ffb76d7ba4728106fe3137bfdbf6d26d77b.script [ctx] 10000]
