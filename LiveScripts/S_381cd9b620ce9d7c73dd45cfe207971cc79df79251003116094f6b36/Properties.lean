import LiveScripts.Shared
import LiveScripts.S_381cd9b620ce9d7c73dd45cfe207971cc79df79251003116094f6b36.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_381cd9b620ce9d7c73dd45cfe207971cc79df79251003116094f6b36.script [ctx] 10000]
