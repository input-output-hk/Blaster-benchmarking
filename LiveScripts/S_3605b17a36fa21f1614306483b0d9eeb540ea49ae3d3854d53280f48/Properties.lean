import LiveScripts.Shared
import LiveScripts.S_3605b17a36fa21f1614306483b0d9eeb540ea49ae3d3854d53280f48.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3605b17a36fa21f1614306483b0d9eeb540ea49ae3d3854d53280f48.script [ctx] 10000]
