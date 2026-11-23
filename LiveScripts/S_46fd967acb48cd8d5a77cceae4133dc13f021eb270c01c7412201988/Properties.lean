import LiveScripts.Shared
import LiveScripts.S_46fd967acb48cd8d5a77cceae4133dc13f021eb270c01c7412201988.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_46fd967acb48cd8d5a77cceae4133dc13f021eb270c01c7412201988.script [ctx] 10000]
