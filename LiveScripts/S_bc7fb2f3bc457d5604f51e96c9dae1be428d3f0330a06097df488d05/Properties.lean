import LiveScripts.Shared
import LiveScripts.S_bc7fb2f3bc457d5604f51e96c9dae1be428d3f0330a06097df488d05.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bc7fb2f3bc457d5604f51e96c9dae1be428d3f0330a06097df488d05.script [ctx] 10000]
