import LiveScripts.Shared
import LiveScripts.S_c485a5c665769a39b4e7378337ea6452ad82f362be638a8103827ee6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c485a5c665769a39b4e7378337ea6452ad82f362be638a8103827ee6.script [ctx] 10000]
