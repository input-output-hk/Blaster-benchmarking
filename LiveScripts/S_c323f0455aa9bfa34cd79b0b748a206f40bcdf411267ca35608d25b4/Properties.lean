import LiveScripts.Shared
import LiveScripts.S_c323f0455aa9bfa34cd79b0b748a206f40bcdf411267ca35608d25b4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c323f0455aa9bfa34cd79b0b748a206f40bcdf411267ca35608d25b4.script [ctx] 10000]
