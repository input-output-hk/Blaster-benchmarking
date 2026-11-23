import LiveScripts.Shared
import LiveScripts.S_c4d7d117d9ebcde6db28db40837ff2b1401e9eaaa6eecea9e070e209.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c4d7d117d9ebcde6db28db40837ff2b1401e9eaaa6eecea9e070e209.script [redeemer, ctx] 10000]
