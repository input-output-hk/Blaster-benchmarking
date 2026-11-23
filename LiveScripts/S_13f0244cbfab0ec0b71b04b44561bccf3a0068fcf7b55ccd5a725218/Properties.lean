import LiveScripts.Shared
import LiveScripts.S_13f0244cbfab0ec0b71b04b44561bccf3a0068fcf7b55ccd5a725218.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_13f0244cbfab0ec0b71b04b44561bccf3a0068fcf7b55ccd5a725218.script [datum, redeemer, ctx] 10000]
