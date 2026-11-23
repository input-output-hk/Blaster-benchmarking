import LiveScripts.Shared
import LiveScripts.S_52b7538e67c240ccdb6890c3fd9759ee3037dc4aa7568b2e1ffb1dd4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_52b7538e67c240ccdb6890c3fd9759ee3037dc4aa7568b2e1ffb1dd4.script [ctx] 10000]
