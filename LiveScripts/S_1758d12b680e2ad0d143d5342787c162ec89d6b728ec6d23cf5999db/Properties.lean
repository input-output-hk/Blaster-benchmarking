import LiveScripts.Shared
import LiveScripts.S_1758d12b680e2ad0d143d5342787c162ec89d6b728ec6d23cf5999db.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1758d12b680e2ad0d143d5342787c162ec89d6b728ec6d23cf5999db.script [ctx] 10000]
