import LiveScripts.Shared
import LiveScripts.S_728b60e116cf535e36ffbb491f8af2633abd7ce07b1f814915adef8c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_728b60e116cf535e36ffbb491f8af2633abd7ce07b1f814915adef8c.script [ctx] 10000]
