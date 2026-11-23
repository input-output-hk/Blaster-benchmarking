import LiveScripts.Shared
import LiveScripts.S_968e171a947572b53dd4c84e9cf7a68553335c09f3b839bc9abd33b2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_968e171a947572b53dd4c84e9cf7a68553335c09f3b839bc9abd33b2.script [ctx] 10000]
