import LiveScripts.Shared
import LiveScripts.S_ff8754379f6e9c797f2e038828f44542e5223dbabf0fe2428a972b4b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ff8754379f6e9c797f2e038828f44542e5223dbabf0fe2428a972b4b.script [redeemer, ctx] 10000]
