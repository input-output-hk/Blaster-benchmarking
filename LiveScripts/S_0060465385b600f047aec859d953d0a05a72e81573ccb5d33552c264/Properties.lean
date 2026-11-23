import LiveScripts.Shared
import LiveScripts.S_0060465385b600f047aec859d953d0a05a72e81573ccb5d33552c264.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0060465385b600f047aec859d953d0a05a72e81573ccb5d33552c264.script [ctx] 10000]
