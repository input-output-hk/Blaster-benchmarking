import LiveScripts.Shared
import LiveScripts.S_1a45d6129040bbb9a7e14ad28fe63a53e4bfb45fee0adbf8a6f09058.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1a45d6129040bbb9a7e14ad28fe63a53e4bfb45fee0adbf8a6f09058.script [datum, redeemer, ctx] 10000]
