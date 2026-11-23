import LiveScripts.Shared
import LiveScripts.S_c945d8837304bd64a50f4b2b3d37a07fc899ba778b4c9f5b912aad5a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c945d8837304bd64a50f4b2b3d37a07fc899ba778b4c9f5b912aad5a.script [ctx] 10000]
