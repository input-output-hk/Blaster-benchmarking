import LiveScripts.Shared
import LiveScripts.S_c0a3944283a2cb0a41480f09a198ef3d411f76bdd88f8508467551ec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c0a3944283a2cb0a41480f09a198ef3d411f76bdd88f8508467551ec.script [ctx] 10000]
