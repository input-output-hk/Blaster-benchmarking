import LiveScripts.Shared
import LiveScripts.S_a7ff14a2859518e4ed9a3dcf58fc40033066e4f73e688db38b44e3fd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a7ff14a2859518e4ed9a3dcf58fc40033066e4f73e688db38b44e3fd.script [ctx] 10000]
