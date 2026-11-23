import LiveScripts.Shared
import LiveScripts.S_3b643e362bbc6954cc5af47937b040fd35c61ad548298727a38c363a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3b643e362bbc6954cc5af47937b040fd35c61ad548298727a38c363a.script [ctx] 10000]
