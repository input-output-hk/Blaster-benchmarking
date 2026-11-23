import LiveScripts.Shared
import LiveScripts.S_e2a916c7a20f53970e7270dd27918b5104a3dfe06dcf47ecd0395844.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e2a916c7a20f53970e7270dd27918b5104a3dfe06dcf47ecd0395844.script [ctx] 10000]
