import LiveScripts.Shared
import LiveScripts.S_c0f43ec2f37f86373fe036df310457d6355051ef9c7c112ac51cae86.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c0f43ec2f37f86373fe036df310457d6355051ef9c7c112ac51cae86.script [ctx] 10000]
