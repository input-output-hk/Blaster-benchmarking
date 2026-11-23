import LiveScripts.Shared
import LiveScripts.S_e0514421cbd6914f478e1e0fb264f8a95a2ef6bbb4cee1497026140d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e0514421cbd6914f478e1e0fb264f8a95a2ef6bbb4cee1497026140d.script [redeemer, ctx] 10000]
