import LiveScripts.Shared
import LiveScripts.S_dd73cc68a954b839bc8f52ea9439a517b0648460bd16bcb237353dbc.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dd73cc68a954b839bc8f52ea9439a517b0648460bd16bcb237353dbc.script [datum, redeemer, ctx] 10000]
