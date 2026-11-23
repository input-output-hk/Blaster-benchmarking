import LiveScripts.Shared
import LiveScripts.S_ba135e4ddc1fdb0918cb20b61b7b6f5f3707b15761719cf0047195d2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ba135e4ddc1fdb0918cb20b61b7b6f5f3707b15761719cf0047195d2.script [redeemer, ctx] 10000]
