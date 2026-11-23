import LiveScripts.Shared
import LiveScripts.S_4dd522fb07d1f895ee63270b040e8b6434aa848a9c48ee16a7903aad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4dd522fb07d1f895ee63270b040e8b6434aa848a9c48ee16a7903aad.script [datum, redeemer, ctx] 10000]
