import LiveScripts.Shared
import LiveScripts.S_19d5f4e5267858da0bdb3542cc7f8fbe1258df88eb25de967725aa59.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_19d5f4e5267858da0bdb3542cc7f8fbe1258df88eb25de967725aa59.script [ctx] 10000]
