import LiveScripts.Shared
import LiveScripts.S_9e130eb0323f31df50bfbb731f35f5a795a630ef727b4ba272460b55.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9e130eb0323f31df50bfbb731f35f5a795a630ef727b4ba272460b55.script [ctx] 10000]
