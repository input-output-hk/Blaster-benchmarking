import LiveScripts.Shared
import LiveScripts.S_8682d6b6a656989ae90cd4fa88b43513ba7803cf2e645a3456fb89f3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8682d6b6a656989ae90cd4fa88b43513ba7803cf2e645a3456fb89f3.script [ctx] 10000]
