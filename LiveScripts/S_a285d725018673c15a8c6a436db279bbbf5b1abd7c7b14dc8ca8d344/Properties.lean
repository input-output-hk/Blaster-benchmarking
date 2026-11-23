import LiveScripts.Shared
import LiveScripts.S_a285d725018673c15a8c6a436db279bbbf5b1abd7c7b14dc8ca8d344.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a285d725018673c15a8c6a436db279bbbf5b1abd7c7b14dc8ca8d344.script [ctx] 10000]
