import LiveScripts.Shared
import LiveScripts.S_aeaedabdce7fec42608bfe4e555b428037eab1b93164be22e1b9a977.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aeaedabdce7fec42608bfe4e555b428037eab1b93164be22e1b9a977.script [ctx] 10000]
