import LiveScripts.Shared
import LiveScripts.S_7b9487673cf426ffec7e4d0f64f32dc78c20a26691914947e1009a38.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7b9487673cf426ffec7e4d0f64f32dc78c20a26691914947e1009a38.script [ctx] 10000]
