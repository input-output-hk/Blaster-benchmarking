import LiveScripts.Shared
import LiveScripts.S_5f0112661e05e61ccde3dc6f0baef644628ec28821de5fd995823d33.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5f0112661e05e61ccde3dc6f0baef644628ec28821de5fd995823d33.script [ctx] 10000]
