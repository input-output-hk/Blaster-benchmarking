import LiveScripts.Shared
import LiveScripts.S_703fd821d6514d5251cb404b1c719ec2a70f21f95650f70af7d204d5.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_703fd821d6514d5251cb404b1c719ec2a70f21f95650f70af7d204d5.script [ctx] 10000]
