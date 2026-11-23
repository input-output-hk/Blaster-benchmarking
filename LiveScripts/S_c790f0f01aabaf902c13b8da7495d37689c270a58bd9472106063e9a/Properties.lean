import LiveScripts.Shared
import LiveScripts.S_c790f0f01aabaf902c13b8da7495d37689c270a58bd9472106063e9a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c790f0f01aabaf902c13b8da7495d37689c270a58bd9472106063e9a.script [ctx] 10000]
