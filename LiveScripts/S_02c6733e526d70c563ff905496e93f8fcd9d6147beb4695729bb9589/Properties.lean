import LiveScripts.Shared
import LiveScripts.S_02c6733e526d70c563ff905496e93f8fcd9d6147beb4695729bb9589.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_02c6733e526d70c563ff905496e93f8fcd9d6147beb4695729bb9589.script [ctx] 10000]
