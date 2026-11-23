import LiveScripts.Shared
import LiveScripts.S_3d6feb4449109230caf46281f52f5cb0c4881f2dd362a20d897aa235.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3d6feb4449109230caf46281f52f5cb0c4881f2dd362a20d897aa235.script [datum, redeemer, ctx] 10000]
