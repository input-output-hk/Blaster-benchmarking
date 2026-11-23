import LiveScripts.Shared
import LiveScripts.S_e8e031a07efb9d6bb4c7f2d2f9511a35457266cde58b3707fb7ff10e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e8e031a07efb9d6bb4c7f2d2f9511a35457266cde58b3707fb7ff10e.script [redeemer, ctx] 10000]
