import LiveScripts.Shared
import LiveScripts.S_d54ce8d9ec974cd27c463d978d6db95af22b8d564153e8daf823fe63.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d54ce8d9ec974cd27c463d978d6db95af22b8d564153e8daf823fe63.script [datum, redeemer, ctx] 10000]
