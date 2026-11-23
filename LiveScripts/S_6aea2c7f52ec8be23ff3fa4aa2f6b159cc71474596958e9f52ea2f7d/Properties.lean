import LiveScripts.Shared
import LiveScripts.S_6aea2c7f52ec8be23ff3fa4aa2f6b159cc71474596958e9f52ea2f7d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6aea2c7f52ec8be23ff3fa4aa2f6b159cc71474596958e9f52ea2f7d.script [ctx] 10000]
