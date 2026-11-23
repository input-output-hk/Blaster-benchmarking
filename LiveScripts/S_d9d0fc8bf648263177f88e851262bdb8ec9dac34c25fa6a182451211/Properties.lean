import LiveScripts.Shared
import LiveScripts.S_d9d0fc8bf648263177f88e851262bdb8ec9dac34c25fa6a182451211.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d9d0fc8bf648263177f88e851262bdb8ec9dac34c25fa6a182451211.script [ctx] 10000]
