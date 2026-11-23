import LiveScripts.Shared
import LiveScripts.S_f9d85b7f05989346665dd1b046e4db7c9f6736cf583146c3f12e0f12.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f9d85b7f05989346665dd1b046e4db7c9f6736cf583146c3f12e0f12.script [ctx] 10000]
