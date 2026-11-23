import LiveScripts.Shared
import LiveScripts.S_818561f722b9c1c61541116e191f176e241fe7b3e24d7227282b3bd0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_818561f722b9c1c61541116e191f176e241fe7b3e24d7227282b3bd0.script [ctx] 10000]
