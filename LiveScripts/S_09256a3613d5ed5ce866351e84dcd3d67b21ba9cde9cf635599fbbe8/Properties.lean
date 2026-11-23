import LiveScripts.Shared
import LiveScripts.S_09256a3613d5ed5ce866351e84dcd3d67b21ba9cde9cf635599fbbe8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_09256a3613d5ed5ce866351e84dcd3d67b21ba9cde9cf635599fbbe8.script [ctx] 10000]
