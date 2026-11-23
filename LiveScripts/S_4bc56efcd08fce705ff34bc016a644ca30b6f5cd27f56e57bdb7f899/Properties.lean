import LiveScripts.Shared
import LiveScripts.S_4bc56efcd08fce705ff34bc016a644ca30b6f5cd27f56e57bdb7f899.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4bc56efcd08fce705ff34bc016a644ca30b6f5cd27f56e57bdb7f899.script [datum, redeemer, ctx] 10000]
