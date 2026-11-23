import LiveScripts.Shared
import LiveScripts.S_fa69cc95d92be60bdcfba3f3cdc93fe0cb2a1d98b12afed596020eec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fa69cc95d92be60bdcfba3f3cdc93fe0cb2a1d98b12afed596020eec.script [ctx] 10000]
