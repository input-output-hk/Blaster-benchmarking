import LiveScripts.Shared
import LiveScripts.S_8bbc3b7c8e2787ae15037f8217d9ec07e38ffb2e0982a961715c2ea9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8bbc3b7c8e2787ae15037f8217d9ec07e38ffb2e0982a961715c2ea9.script [ctx] 10000]
