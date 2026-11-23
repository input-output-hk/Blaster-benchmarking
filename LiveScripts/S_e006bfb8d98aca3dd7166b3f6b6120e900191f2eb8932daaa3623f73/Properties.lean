import LiveScripts.Shared
import LiveScripts.S_e006bfb8d98aca3dd7166b3f6b6120e900191f2eb8932daaa3623f73.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e006bfb8d98aca3dd7166b3f6b6120e900191f2eb8932daaa3623f73.script [datum, redeemer, ctx] 10000]
