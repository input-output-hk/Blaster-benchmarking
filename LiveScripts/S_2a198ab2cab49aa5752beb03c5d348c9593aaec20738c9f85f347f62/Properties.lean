import LiveScripts.Shared
import LiveScripts.S_2a198ab2cab49aa5752beb03c5d348c9593aaec20738c9f85f347f62.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2a198ab2cab49aa5752beb03c5d348c9593aaec20738c9f85f347f62.script [ctx] 10000]
