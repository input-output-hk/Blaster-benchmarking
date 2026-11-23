import LiveScripts.Shared
import LiveScripts.S_8fc6750c46a56ac1a1202fe58842ad0306d9326560c1c76b171a4900.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8fc6750c46a56ac1a1202fe58842ad0306d9326560c1c76b171a4900.script [ctx] 10000]
