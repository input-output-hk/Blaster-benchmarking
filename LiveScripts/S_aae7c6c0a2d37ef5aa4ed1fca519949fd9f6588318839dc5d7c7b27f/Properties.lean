import LiveScripts.Shared
import LiveScripts.S_aae7c6c0a2d37ef5aa4ed1fca519949fd9f6588318839dc5d7c7b27f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aae7c6c0a2d37ef5aa4ed1fca519949fd9f6588318839dc5d7c7b27f.script [datum, redeemer, ctx] 10000]
