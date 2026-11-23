import LiveScripts.Shared
import LiveScripts.S_3a44b443041748d84ec64cff92e8a83e8762789f97a6f4ad771b9b88.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3a44b443041748d84ec64cff92e8a83e8762789f97a6f4ad771b9b88.script [ctx] 10000]
