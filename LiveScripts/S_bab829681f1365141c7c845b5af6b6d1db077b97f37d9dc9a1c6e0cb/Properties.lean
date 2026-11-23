import LiveScripts.Shared
import LiveScripts.S_bab829681f1365141c7c845b5af6b6d1db077b97f37d9dc9a1c6e0cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bab829681f1365141c7c845b5af6b6d1db077b97f37d9dc9a1c6e0cb.script [ctx] 10000]
