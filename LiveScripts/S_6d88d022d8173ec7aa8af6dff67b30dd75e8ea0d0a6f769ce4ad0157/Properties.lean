import LiveScripts.Shared
import LiveScripts.S_6d88d022d8173ec7aa8af6dff67b30dd75e8ea0d0a6f769ce4ad0157.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6d88d022d8173ec7aa8af6dff67b30dd75e8ea0d0a6f769ce4ad0157.script [ctx] 10000]
