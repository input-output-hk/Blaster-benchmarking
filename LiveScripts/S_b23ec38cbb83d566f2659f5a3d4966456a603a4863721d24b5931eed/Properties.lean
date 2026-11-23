import LiveScripts.Shared
import LiveScripts.S_b23ec38cbb83d566f2659f5a3d4966456a603a4863721d24b5931eed.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b23ec38cbb83d566f2659f5a3d4966456a603a4863721d24b5931eed.script [ctx] 10000]
