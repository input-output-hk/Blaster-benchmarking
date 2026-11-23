import LiveScripts.Shared
import LiveScripts.S_b5452b1abacf08a2491f3a601eb442036db5f558480897dc07efac0a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b5452b1abacf08a2491f3a601eb442036db5f558480897dc07efac0a.script [ctx] 10000]
