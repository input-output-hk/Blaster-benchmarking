import LiveScripts.Shared
import LiveScripts.S_3016010d2ba7a6c112c2dd8958da8b3ab4e4f4ae63d3cc60fdb5674d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3016010d2ba7a6c112c2dd8958da8b3ab4e4f4ae63d3cc60fdb5674d.script [ctx] 10000]
