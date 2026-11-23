import LiveScripts.Shared
import LiveScripts.S_075b0ce5d592d51262e6d3e1c8a88e94c86470f95dc7b8e7a9139782.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_075b0ce5d592d51262e6d3e1c8a88e94c86470f95dc7b8e7a9139782.script [ctx] 10000]
