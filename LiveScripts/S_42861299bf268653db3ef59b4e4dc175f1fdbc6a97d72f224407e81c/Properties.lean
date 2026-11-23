import LiveScripts.Shared
import LiveScripts.S_42861299bf268653db3ef59b4e4dc175f1fdbc6a97d72f224407e81c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_42861299bf268653db3ef59b4e4dc175f1fdbc6a97d72f224407e81c.script [ctx] 10000]
