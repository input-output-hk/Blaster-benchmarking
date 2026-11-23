import LiveScripts.Shared
import LiveScripts.S_003870079228b6bcd975822e25601aa361caef69322aec289f5b8d1e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_003870079228b6bcd975822e25601aa361caef69322aec289f5b8d1e.script [ctx] 10000]
