import LiveScripts.Shared
import LiveScripts.S_a3437274f93dfdf36e949a4d9533e964aebde7a1cd229baeca7bdafa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a3437274f93dfdf36e949a4d9533e964aebde7a1cd229baeca7bdafa.script [ctx] 10000]
