import LiveScripts.Shared
import LiveScripts.S_a54bc78ce92e48ca736034bebeae9dc1565d639b6225f0f5fb6cc297.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a54bc78ce92e48ca736034bebeae9dc1565d639b6225f0f5fb6cc297.script [datum, redeemer, ctx] 10000]
