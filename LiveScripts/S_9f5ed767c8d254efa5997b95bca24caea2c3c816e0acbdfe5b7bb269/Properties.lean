import LiveScripts.Shared
import LiveScripts.S_9f5ed767c8d254efa5997b95bca24caea2c3c816e0acbdfe5b7bb269.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9f5ed767c8d254efa5997b95bca24caea2c3c816e0acbdfe5b7bb269.script [ctx] 10000]
