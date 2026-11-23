import LiveScripts.Shared
import LiveScripts.S_7444634afd3b0c81ca45c2079cfcb3f14788c7410e06c84529b9fcc1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7444634afd3b0c81ca45c2079cfcb3f14788c7410e06c84529b9fcc1.script [datum, redeemer, ctx] 10000]
