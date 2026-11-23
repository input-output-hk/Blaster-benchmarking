import LiveScripts.Shared
import LiveScripts.S_7b240311bb77a4d037798d398eafc130e4a47037751f51d684ac76e8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7b240311bb77a4d037798d398eafc130e4a47037751f51d684ac76e8.script [ctx] 10000]
