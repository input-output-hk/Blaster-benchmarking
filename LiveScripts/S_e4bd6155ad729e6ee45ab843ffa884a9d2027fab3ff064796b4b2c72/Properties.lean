import LiveScripts.Shared
import LiveScripts.S_e4bd6155ad729e6ee45ab843ffa884a9d2027fab3ff064796b4b2c72.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e4bd6155ad729e6ee45ab843ffa884a9d2027fab3ff064796b4b2c72.script [ctx] 10000]
