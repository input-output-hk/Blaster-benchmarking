import LiveScripts.Shared
import LiveScripts.S_c6a913db347adc3d6c10ef59e7572e947a2eb6ca1a1cc29a512fb098.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c6a913db347adc3d6c10ef59e7572e947a2eb6ca1a1cc29a512fb098.script [ctx] 10000]
