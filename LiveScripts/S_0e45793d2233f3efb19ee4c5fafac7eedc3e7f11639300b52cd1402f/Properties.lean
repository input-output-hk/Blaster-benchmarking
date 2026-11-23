import LiveScripts.Shared
import LiveScripts.S_0e45793d2233f3efb19ee4c5fafac7eedc3e7f11639300b52cd1402f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0e45793d2233f3efb19ee4c5fafac7eedc3e7f11639300b52cd1402f.script [redeemer, ctx] 10000]
