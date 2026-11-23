import LiveScripts.Shared
import LiveScripts.S_f5a1157566a72caeeaf2e6a1edfee27bebe0e4e01d851302c9f9c962.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f5a1157566a72caeeaf2e6a1edfee27bebe0e4e01d851302c9f9c962.script [redeemer, ctx] 10000]
