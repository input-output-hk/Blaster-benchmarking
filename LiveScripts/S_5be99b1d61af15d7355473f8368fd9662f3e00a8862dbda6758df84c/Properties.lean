import LiveScripts.Shared
import LiveScripts.S_5be99b1d61af15d7355473f8368fd9662f3e00a8862dbda6758df84c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5be99b1d61af15d7355473f8368fd9662f3e00a8862dbda6758df84c.script [ctx] 10000]
