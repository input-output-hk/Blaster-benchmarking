import LiveScripts.Shared
import LiveScripts.S_8b1266f0d91ff469fa5e76d8918d70a377e30a8ba5d3484790d812c5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8b1266f0d91ff469fa5e76d8918d70a377e30a8ba5d3484790d812c5.script [ctx] 10000]
