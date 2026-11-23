import LiveScripts.Shared
import LiveScripts.S_d0cc78b45ff630c03186dc670dab1137b673422f8567c78ee4015fd0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d0cc78b45ff630c03186dc670dab1137b673422f8567c78ee4015fd0.script [ctx] 10000]
