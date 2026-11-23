import LiveScripts.Shared
import LiveScripts.S_0e2e6aa55608cc4d6a47de10dd9b2efb565b7efb3ea0477abff01a04.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0e2e6aa55608cc4d6a47de10dd9b2efb565b7efb3ea0477abff01a04.script [ctx] 10000]
