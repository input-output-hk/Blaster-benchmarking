import LiveScripts.Shared
import LiveScripts.S_bc2d3b7cf1009c788b1daf2208a38026ab20d7f8209d896ad1a09c14.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bc2d3b7cf1009c788b1daf2208a38026ab20d7f8209d896ad1a09c14.script [ctx] 10000]
