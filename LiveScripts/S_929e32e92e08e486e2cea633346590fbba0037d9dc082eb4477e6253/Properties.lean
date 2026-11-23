import LiveScripts.Shared
import LiveScripts.S_929e32e92e08e486e2cea633346590fbba0037d9dc082eb4477e6253.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_929e32e92e08e486e2cea633346590fbba0037d9dc082eb4477e6253.script [redeemer, ctx] 10000]
