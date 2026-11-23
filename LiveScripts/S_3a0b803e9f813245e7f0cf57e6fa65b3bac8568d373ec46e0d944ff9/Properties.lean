import LiveScripts.Shared
import LiveScripts.S_3a0b803e9f813245e7f0cf57e6fa65b3bac8568d373ec46e0d944ff9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3a0b803e9f813245e7f0cf57e6fa65b3bac8568d373ec46e0d944ff9.script [ctx] 10000]
