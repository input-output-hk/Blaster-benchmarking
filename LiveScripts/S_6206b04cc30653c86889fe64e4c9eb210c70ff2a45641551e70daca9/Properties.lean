import LiveScripts.Shared
import LiveScripts.S_6206b04cc30653c86889fe64e4c9eb210c70ff2a45641551e70daca9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6206b04cc30653c86889fe64e4c9eb210c70ff2a45641551e70daca9.script [ctx] 10000]
