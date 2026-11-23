import LiveScripts.Shared
import LiveScripts.S_eb5232a5f5743f8b4b57e6bc5949218af7aa6f7fb9a94e42543b7776.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eb5232a5f5743f8b4b57e6bc5949218af7aa6f7fb9a94e42543b7776.script [ctx] 10000]
