import LiveScripts.Shared
import LiveScripts.S_a273830732c6fb95e72c7c111fc70ce6f30b52d3c6d6e52f74a641af.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a273830732c6fb95e72c7c111fc70ce6f30b52d3c6d6e52f74a641af.script [ctx] 10000]
