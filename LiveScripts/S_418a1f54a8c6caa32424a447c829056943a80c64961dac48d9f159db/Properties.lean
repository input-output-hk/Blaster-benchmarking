import LiveScripts.Shared
import LiveScripts.S_418a1f54a8c6caa32424a447c829056943a80c64961dac48d9f159db.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_418a1f54a8c6caa32424a447c829056943a80c64961dac48d9f159db.script [ctx] 10000]
