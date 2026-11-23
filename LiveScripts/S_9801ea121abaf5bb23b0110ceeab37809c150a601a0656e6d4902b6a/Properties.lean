import LiveScripts.Shared
import LiveScripts.S_9801ea121abaf5bb23b0110ceeab37809c150a601a0656e6d4902b6a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9801ea121abaf5bb23b0110ceeab37809c150a601a0656e6d4902b6a.script [ctx] 10000]
