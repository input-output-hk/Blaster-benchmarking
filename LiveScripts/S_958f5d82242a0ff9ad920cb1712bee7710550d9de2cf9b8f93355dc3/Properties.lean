import LiveScripts.Shared
import LiveScripts.S_958f5d82242a0ff9ad920cb1712bee7710550d9de2cf9b8f93355dc3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_958f5d82242a0ff9ad920cb1712bee7710550d9de2cf9b8f93355dc3.script [ctx] 10000]
