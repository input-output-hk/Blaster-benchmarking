import LiveScripts.Shared
import LiveScripts.S_d98d6c31853c519ca5b98feceab645045cd8b34333326f3e98ebb6e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d98d6c31853c519ca5b98feceab645045cd8b34333326f3e98ebb6e8.script [ctx] 10000]
