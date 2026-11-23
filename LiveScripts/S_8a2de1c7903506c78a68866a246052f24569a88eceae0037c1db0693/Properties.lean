import LiveScripts.Shared
import LiveScripts.S_8a2de1c7903506c78a68866a246052f24569a88eceae0037c1db0693.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8a2de1c7903506c78a68866a246052f24569a88eceae0037c1db0693.script [datum, redeemer, ctx] 10000]
