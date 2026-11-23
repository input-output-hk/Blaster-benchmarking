import LiveScripts.Shared
import LiveScripts.S_b4e81fa9a3291025cd279067daf4e43578d4c3f759e5490958f58cf6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b4e81fa9a3291025cd279067daf4e43578d4c3f759e5490958f58cf6.script [ctx] 10000]
