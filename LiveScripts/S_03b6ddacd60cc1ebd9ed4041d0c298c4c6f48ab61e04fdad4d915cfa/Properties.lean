import LiveScripts.Shared
import LiveScripts.S_03b6ddacd60cc1ebd9ed4041d0c298c4c6f48ab61e04fdad4d915cfa.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_03b6ddacd60cc1ebd9ed4041d0c298c4c6f48ab61e04fdad4d915cfa.script [redeemer, ctx] 10000]
