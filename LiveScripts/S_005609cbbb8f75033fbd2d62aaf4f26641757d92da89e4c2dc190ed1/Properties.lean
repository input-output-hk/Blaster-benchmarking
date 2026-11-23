import LiveScripts.Shared
import LiveScripts.S_005609cbbb8f75033fbd2d62aaf4f26641757d92da89e4c2dc190ed1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_005609cbbb8f75033fbd2d62aaf4f26641757d92da89e4c2dc190ed1.script [ctx] 10000]
