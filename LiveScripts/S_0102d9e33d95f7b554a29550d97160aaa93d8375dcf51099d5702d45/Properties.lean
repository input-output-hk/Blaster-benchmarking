import LiveScripts.Shared
import LiveScripts.S_0102d9e33d95f7b554a29550d97160aaa93d8375dcf51099d5702d45.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0102d9e33d95f7b554a29550d97160aaa93d8375dcf51099d5702d45.script [redeemer, ctx] 10000]
