import LiveScripts.Shared
import LiveScripts.S_6a241ddca988522f7a1d2864cb7852f1c80b1cc93de3388b23a7bfb7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6a241ddca988522f7a1d2864cb7852f1c80b1cc93de3388b23a7bfb7.script [ctx] 10000]
