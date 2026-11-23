import LiveScripts.Shared
import LiveScripts.S_d5febb2757fcf9d2e8b3bf656f9d1f784b6bcebbd31b3d688383e4ac.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d5febb2757fcf9d2e8b3bf656f9d1f784b6bcebbd31b3d688383e4ac.script [ctx] 10000]
