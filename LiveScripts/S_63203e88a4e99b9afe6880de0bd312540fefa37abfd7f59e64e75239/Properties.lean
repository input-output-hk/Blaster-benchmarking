import LiveScripts.Shared
import LiveScripts.S_63203e88a4e99b9afe6880de0bd312540fefa37abfd7f59e64e75239.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_63203e88a4e99b9afe6880de0bd312540fefa37abfd7f59e64e75239.script [ctx] 10000]
