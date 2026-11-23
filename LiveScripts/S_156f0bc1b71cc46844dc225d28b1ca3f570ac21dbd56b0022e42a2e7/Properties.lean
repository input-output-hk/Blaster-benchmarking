import LiveScripts.Shared
import LiveScripts.S_156f0bc1b71cc46844dc225d28b1ca3f570ac21dbd56b0022e42a2e7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_156f0bc1b71cc46844dc225d28b1ca3f570ac21dbd56b0022e42a2e7.script [ctx] 10000]
