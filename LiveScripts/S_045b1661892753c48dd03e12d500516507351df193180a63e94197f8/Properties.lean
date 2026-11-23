import LiveScripts.Shared
import LiveScripts.S_045b1661892753c48dd03e12d500516507351df193180a63e94197f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_045b1661892753c48dd03e12d500516507351df193180a63e94197f8.script [ctx] 10000]
