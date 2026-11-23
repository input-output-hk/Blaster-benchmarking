import LiveScripts.Shared
import LiveScripts.S_ddbebc6263726bcc035934b3b71c1fb144a78a1cbbc57499c45b1e89.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ddbebc6263726bcc035934b3b71c1fb144a78a1cbbc57499c45b1e89.script [datum, redeemer, ctx] 10000]
