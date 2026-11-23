import LiveScripts.Shared
import LiveScripts.S_dee2e7fba06984fba4f2612920ff528ca8d7916b09a1742e706e5943.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dee2e7fba06984fba4f2612920ff528ca8d7916b09a1742e706e5943.script [ctx] 10000]
