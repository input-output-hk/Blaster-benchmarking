import LiveScripts.Shared
import LiveScripts.S_cc6367eea6d8f212ac5b8b76f4148e7be54cc2d91472a6fffe8709d1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cc6367eea6d8f212ac5b8b76f4148e7be54cc2d91472a6fffe8709d1.script [ctx] 10000]
