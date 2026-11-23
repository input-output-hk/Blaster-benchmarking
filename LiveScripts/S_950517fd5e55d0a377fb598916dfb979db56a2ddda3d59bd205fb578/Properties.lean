import LiveScripts.Shared
import LiveScripts.S_950517fd5e55d0a377fb598916dfb979db56a2ddda3d59bd205fb578.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_950517fd5e55d0a377fb598916dfb979db56a2ddda3d59bd205fb578.script [ctx] 10000]
