import LiveScripts.Shared
import LiveScripts.S_ea52b78c3a7de4e1bbd6b24db3d2a010bb6680471b4dc9e54b3d14c9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ea52b78c3a7de4e1bbd6b24db3d2a010bb6680471b4dc9e54b3d14c9.script [ctx] 10000]
