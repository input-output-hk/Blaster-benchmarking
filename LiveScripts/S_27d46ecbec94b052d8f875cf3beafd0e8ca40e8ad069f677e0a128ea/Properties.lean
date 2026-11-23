import LiveScripts.Shared
import LiveScripts.S_27d46ecbec94b052d8f875cf3beafd0e8ca40e8ad069f677e0a128ea.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_27d46ecbec94b052d8f875cf3beafd0e8ca40e8ad069f677e0a128ea.script [datum, redeemer, ctx] 10000]
