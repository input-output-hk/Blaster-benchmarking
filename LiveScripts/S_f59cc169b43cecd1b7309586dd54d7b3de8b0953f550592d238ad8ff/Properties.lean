import LiveScripts.Shared
import LiveScripts.S_f59cc169b43cecd1b7309586dd54d7b3de8b0953f550592d238ad8ff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f59cc169b43cecd1b7309586dd54d7b3de8b0953f550592d238ad8ff.script [ctx] 10000]
