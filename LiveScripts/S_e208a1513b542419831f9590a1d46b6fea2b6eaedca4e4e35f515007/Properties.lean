import LiveScripts.Shared
import LiveScripts.S_e208a1513b542419831f9590a1d46b6fea2b6eaedca4e4e35f515007.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e208a1513b542419831f9590a1d46b6fea2b6eaedca4e4e35f515007.script [ctx] 10000]
