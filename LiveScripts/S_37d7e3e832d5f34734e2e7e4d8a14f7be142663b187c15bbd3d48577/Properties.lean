import LiveScripts.Shared
import LiveScripts.S_37d7e3e832d5f34734e2e7e4d8a14f7be142663b187c15bbd3d48577.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_37d7e3e832d5f34734e2e7e4d8a14f7be142663b187c15bbd3d48577.script [ctx] 10000]
