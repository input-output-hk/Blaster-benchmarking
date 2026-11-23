import LiveScripts.Shared
import LiveScripts.S_5a71b47f37d5b7409628c4c41f861ea144419142985c5566922a5c84.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5a71b47f37d5b7409628c4c41f861ea144419142985c5566922a5c84.script [ctx] 10000]
