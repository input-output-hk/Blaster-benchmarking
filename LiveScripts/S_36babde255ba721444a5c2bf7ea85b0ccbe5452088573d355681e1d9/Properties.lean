import LiveScripts.Shared
import LiveScripts.S_36babde255ba721444a5c2bf7ea85b0ccbe5452088573d355681e1d9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_36babde255ba721444a5c2bf7ea85b0ccbe5452088573d355681e1d9.script [redeemer, ctx] 10000]
