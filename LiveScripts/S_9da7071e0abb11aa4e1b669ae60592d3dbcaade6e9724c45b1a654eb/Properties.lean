import LiveScripts.Shared
import LiveScripts.S_9da7071e0abb11aa4e1b669ae60592d3dbcaade6e9724c45b1a654eb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9da7071e0abb11aa4e1b669ae60592d3dbcaade6e9724c45b1a654eb.script [ctx] 10000]
