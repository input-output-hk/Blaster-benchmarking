import LiveScripts.Shared
import LiveScripts.S_1d17b3ae844c6dd998b130893dd2e7691d8f394caa254dd0f5d1ee83.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1d17b3ae844c6dd998b130893dd2e7691d8f394caa254dd0f5d1ee83.script [ctx] 10000]
