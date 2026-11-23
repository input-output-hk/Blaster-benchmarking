import LiveScripts.Shared
import LiveScripts.S_fa6c32f89e90ee3e4a66ef1025103240ea53a098443803fbce373e14.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fa6c32f89e90ee3e4a66ef1025103240ea53a098443803fbce373e14.script [ctx] 10000]
