import LiveScripts.Shared
import LiveScripts.S_8c093b35f6087e0b495299c26a0db7571f29eae549cba17a186f56d8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8c093b35f6087e0b495299c26a0db7571f29eae549cba17a186f56d8.script [ctx] 10000]
