import LiveScripts.Shared
import LiveScripts.S_ec0046a12a97d92a48ec49f5cf3723bd27290fcf4323a581ee4f356f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ec0046a12a97d92a48ec49f5cf3723bd27290fcf4323a581ee4f356f.script [ctx] 10000]
