import LiveScripts.Shared
import LiveScripts.S_34afef90912f33d69f2158ab38ed1eba3bc0bc91b70da7d47b61b4b9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_34afef90912f33d69f2158ab38ed1eba3bc0bc91b70da7d47b61b4b9.script [ctx] 10000]
