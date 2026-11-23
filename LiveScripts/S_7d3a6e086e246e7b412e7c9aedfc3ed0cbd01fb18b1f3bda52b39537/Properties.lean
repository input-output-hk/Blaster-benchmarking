import LiveScripts.Shared
import LiveScripts.S_7d3a6e086e246e7b412e7c9aedfc3ed0cbd01fb18b1f3bda52b39537.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7d3a6e086e246e7b412e7c9aedfc3ed0cbd01fb18b1f3bda52b39537.script [datum, redeemer, ctx] 10000]
