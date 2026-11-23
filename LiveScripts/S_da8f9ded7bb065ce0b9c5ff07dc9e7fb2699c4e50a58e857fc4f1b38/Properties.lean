import LiveScripts.Shared
import LiveScripts.S_da8f9ded7bb065ce0b9c5ff07dc9e7fb2699c4e50a58e857fc4f1b38.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_da8f9ded7bb065ce0b9c5ff07dc9e7fb2699c4e50a58e857fc4f1b38.script [ctx] 10000]
