import LiveScripts.Shared
import LiveScripts.S_3f5b6ca8590bb5f877e132ca17c6b89dae08a698f874a14ee79faf1a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3f5b6ca8590bb5f877e132ca17c6b89dae08a698f874a14ee79faf1a.script [ctx] 10000]
