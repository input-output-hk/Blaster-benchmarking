import LiveScripts.Shared
import LiveScripts.S_737638b371d522d3d6ad9a95e0d58e710b8eded71c8d5072790a7a11.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_737638b371d522d3d6ad9a95e0d58e710b8eded71c8d5072790a7a11.script [redeemer, ctx] 10000]
