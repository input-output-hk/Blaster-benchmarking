import LiveScripts.Shared
import LiveScripts.S_fe7c786ab321f41c654ef6c1af7b3250a613c24e4213e0425a7ae456.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fe7c786ab321f41c654ef6c1af7b3250a613c24e4213e0425a7ae456.script [redeemer, ctx] 10000]
