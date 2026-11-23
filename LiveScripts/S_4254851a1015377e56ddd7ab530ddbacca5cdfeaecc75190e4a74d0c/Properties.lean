import LiveScripts.Shared
import LiveScripts.S_4254851a1015377e56ddd7ab530ddbacca5cdfeaecc75190e4a74d0c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4254851a1015377e56ddd7ab530ddbacca5cdfeaecc75190e4a74d0c.script [ctx] 10000]
