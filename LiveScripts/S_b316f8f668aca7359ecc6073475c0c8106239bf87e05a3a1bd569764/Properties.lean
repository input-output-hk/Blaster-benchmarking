import LiveScripts.Shared
import LiveScripts.S_b316f8f668aca7359ecc6073475c0c8106239bf87e05a3a1bd569764.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b316f8f668aca7359ecc6073475c0c8106239bf87e05a3a1bd569764.script [redeemer, ctx] 10000]
