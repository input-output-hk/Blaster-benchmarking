import LiveScripts.Shared
import LiveScripts.S_89b970d0db59c7d74b16eb9e4c909a853a7bbfcd01ee69751314e1b1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_89b970d0db59c7d74b16eb9e4c909a853a7bbfcd01ee69751314e1b1.script [ctx] 10000]
