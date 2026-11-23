import LiveScripts.Shared
import LiveScripts.S_62a68e0b3ab10e752725aa44f5bcdd7c6c3d0cfe39eab5477293c9a3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_62a68e0b3ab10e752725aa44f5bcdd7c6c3d0cfe39eab5477293c9a3.script [ctx] 10000]
