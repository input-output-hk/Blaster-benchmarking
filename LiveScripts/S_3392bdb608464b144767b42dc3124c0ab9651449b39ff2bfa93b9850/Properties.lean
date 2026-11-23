import LiveScripts.Shared
import LiveScripts.S_3392bdb608464b144767b42dc3124c0ab9651449b39ff2bfa93b9850.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3392bdb608464b144767b42dc3124c0ab9651449b39ff2bfa93b9850.script [ctx] 10000]
