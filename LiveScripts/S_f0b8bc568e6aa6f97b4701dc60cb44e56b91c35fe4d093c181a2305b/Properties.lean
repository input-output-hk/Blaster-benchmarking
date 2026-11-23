import LiveScripts.Shared
import LiveScripts.S_f0b8bc568e6aa6f97b4701dc60cb44e56b91c35fe4d093c181a2305b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f0b8bc568e6aa6f97b4701dc60cb44e56b91c35fe4d093c181a2305b.script [ctx] 10000]
