import LiveScripts.Shared
import LiveScripts.S_86201ca242ee5fcf2a83d5b6d7f20512479022cc2035dd2082736fa9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_86201ca242ee5fcf2a83d5b6d7f20512479022cc2035dd2082736fa9.script [redeemer, ctx] 10000]
