import LiveScripts.Shared
import LiveScripts.S_d5e711bb22cc788875e026953b5b173def58f72a4674adaa1c7ee342.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d5e711bb22cc788875e026953b5b173def58f72a4674adaa1c7ee342.script [ctx] 10000]
