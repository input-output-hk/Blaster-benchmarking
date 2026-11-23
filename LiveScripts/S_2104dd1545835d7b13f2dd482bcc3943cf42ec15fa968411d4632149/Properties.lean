import LiveScripts.Shared
import LiveScripts.S_2104dd1545835d7b13f2dd482bcc3943cf42ec15fa968411d4632149.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2104dd1545835d7b13f2dd482bcc3943cf42ec15fa968411d4632149.script [ctx] 10000]
