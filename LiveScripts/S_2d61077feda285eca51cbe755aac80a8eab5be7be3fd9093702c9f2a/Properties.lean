import LiveScripts.Shared
import LiveScripts.S_2d61077feda285eca51cbe755aac80a8eab5be7be3fd9093702c9f2a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d61077feda285eca51cbe755aac80a8eab5be7be3fd9093702c9f2a.script [ctx] 10000]
