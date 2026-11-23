import LiveScripts.Shared
import LiveScripts.S_1ffc1d2cc7afe2405e39b908bddb2cd842749fd3a755810fa8b980d3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1ffc1d2cc7afe2405e39b908bddb2cd842749fd3a755810fa8b980d3.script [redeemer, ctx] 10000]
