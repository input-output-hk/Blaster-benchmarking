import LiveScripts.Shared
import LiveScripts.S_7d9e4a0ee1a3f5d5ff8159ea91a83310cf2795ee7a87170c7aea05ae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7d9e4a0ee1a3f5d5ff8159ea91a83310cf2795ee7a87170c7aea05ae.script [ctx] 10000]
