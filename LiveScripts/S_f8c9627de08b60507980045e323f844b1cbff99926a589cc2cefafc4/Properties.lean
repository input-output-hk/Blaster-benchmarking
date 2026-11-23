import LiveScripts.Shared
import LiveScripts.S_f8c9627de08b60507980045e323f844b1cbff99926a589cc2cefafc4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f8c9627de08b60507980045e323f844b1cbff99926a589cc2cefafc4.script [ctx] 10000]
