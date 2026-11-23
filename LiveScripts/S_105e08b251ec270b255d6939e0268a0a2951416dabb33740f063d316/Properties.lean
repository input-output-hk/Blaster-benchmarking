import LiveScripts.Shared
import LiveScripts.S_105e08b251ec270b255d6939e0268a0a2951416dabb33740f063d316.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_105e08b251ec270b255d6939e0268a0a2951416dabb33740f063d316.script [ctx] 10000]
