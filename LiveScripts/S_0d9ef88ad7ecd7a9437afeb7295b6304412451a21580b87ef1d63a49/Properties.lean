import LiveScripts.Shared
import LiveScripts.S_0d9ef88ad7ecd7a9437afeb7295b6304412451a21580b87ef1d63a49.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0d9ef88ad7ecd7a9437afeb7295b6304412451a21580b87ef1d63a49.script [ctx] 10000]
