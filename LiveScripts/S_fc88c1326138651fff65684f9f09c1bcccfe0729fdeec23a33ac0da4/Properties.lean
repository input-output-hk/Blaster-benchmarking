import LiveScripts.Shared
import LiveScripts.S_fc88c1326138651fff65684f9f09c1bcccfe0729fdeec23a33ac0da4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fc88c1326138651fff65684f9f09c1bcccfe0729fdeec23a33ac0da4.script [ctx] 10000]
