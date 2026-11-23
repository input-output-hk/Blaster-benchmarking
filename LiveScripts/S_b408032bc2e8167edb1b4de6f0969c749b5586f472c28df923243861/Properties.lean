import LiveScripts.Shared
import LiveScripts.S_b408032bc2e8167edb1b4de6f0969c749b5586f472c28df923243861.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b408032bc2e8167edb1b4de6f0969c749b5586f472c28df923243861.script [ctx] 10000]
