import LiveScripts.Shared
import LiveScripts.S_0ae68f6ca94c61a10eccdf90f8d08c328f1d518c79e6a2c7f99a272e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0ae68f6ca94c61a10eccdf90f8d08c328f1d518c79e6a2c7f99a272e.script [ctx] 10000]
