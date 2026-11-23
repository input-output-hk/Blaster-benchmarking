import LiveScripts.Shared
import LiveScripts.S_0bc55ee77bf1ea13607eeebdef40cfc0b12a6eef1f89a02a63551280.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0bc55ee77bf1ea13607eeebdef40cfc0b12a6eef1f89a02a63551280.script [ctx] 10000]
