import LiveScripts.Shared
import LiveScripts.S_1d4c0f85dcbcc230f1550f30574206c5b9bddff47b7b135edb12de69.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1d4c0f85dcbcc230f1550f30574206c5b9bddff47b7b135edb12de69.script [ctx] 10000]
