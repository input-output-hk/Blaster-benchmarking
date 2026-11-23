import LiveScripts.Shared
import LiveScripts.S_cbd1362aba2c786b2198a54a36ebd3d042c10fe65d3b5e5d55e48cd4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cbd1362aba2c786b2198a54a36ebd3d042c10fe65d3b5e5d55e48cd4.script [ctx] 10000]
