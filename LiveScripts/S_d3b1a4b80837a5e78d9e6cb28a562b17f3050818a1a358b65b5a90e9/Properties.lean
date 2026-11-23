import LiveScripts.Shared
import LiveScripts.S_d3b1a4b80837a5e78d9e6cb28a562b17f3050818a1a358b65b5a90e9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d3b1a4b80837a5e78d9e6cb28a562b17f3050818a1a358b65b5a90e9.script [ctx] 10000]
