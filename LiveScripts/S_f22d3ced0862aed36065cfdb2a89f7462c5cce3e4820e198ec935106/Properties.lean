import LiveScripts.Shared
import LiveScripts.S_f22d3ced0862aed36065cfdb2a89f7462c5cce3e4820e198ec935106.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f22d3ced0862aed36065cfdb2a89f7462c5cce3e4820e198ec935106.script [ctx] 10000]
