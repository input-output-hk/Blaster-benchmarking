import LiveScripts.Shared
import LiveScripts.S_3b72baa75cff12b095ab7a90d6a123006070882d1fb9c4b34811e8ea.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3b72baa75cff12b095ab7a90d6a123006070882d1fb9c4b34811e8ea.script [ctx] 10000]
