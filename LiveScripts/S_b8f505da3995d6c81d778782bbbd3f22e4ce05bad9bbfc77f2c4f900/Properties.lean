import LiveScripts.Shared
import LiveScripts.S_b8f505da3995d6c81d778782bbbd3f22e4ce05bad9bbfc77f2c4f900.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b8f505da3995d6c81d778782bbbd3f22e4ce05bad9bbfc77f2c4f900.script [ctx] 10000]
