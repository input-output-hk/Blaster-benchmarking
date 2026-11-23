import LiveScripts.Shared
import LiveScripts.S_0dee3b64eb0152320b2dd6ba9c3ab9c7a8a00447ca45f29dbf05f977.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0dee3b64eb0152320b2dd6ba9c3ab9c7a8a00447ca45f29dbf05f977.script [ctx] 10000]
