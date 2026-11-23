import LiveScripts.Shared
import LiveScripts.S_c0a24234bb347ddf086dccf1981484deae3a25e1c1637c82b342011f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c0a24234bb347ddf086dccf1981484deae3a25e1c1637c82b342011f.script [ctx] 10000]
