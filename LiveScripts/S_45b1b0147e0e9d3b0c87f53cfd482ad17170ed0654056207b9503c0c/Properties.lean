import LiveScripts.Shared
import LiveScripts.S_45b1b0147e0e9d3b0c87f53cfd482ad17170ed0654056207b9503c0c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_45b1b0147e0e9d3b0c87f53cfd482ad17170ed0654056207b9503c0c.script [ctx] 10000]
