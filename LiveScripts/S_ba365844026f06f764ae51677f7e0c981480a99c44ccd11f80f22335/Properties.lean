import LiveScripts.Shared
import LiveScripts.S_ba365844026f06f764ae51677f7e0c981480a99c44ccd11f80f22335.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ba365844026f06f764ae51677f7e0c981480a99c44ccd11f80f22335.script [ctx] 10000]
