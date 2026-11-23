import LiveScripts.Shared
import LiveScripts.S_6dfbccf2fcfc4226a1dc2d0bffb76c9bbc0c9e692c72505f3b8dc07f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6dfbccf2fcfc4226a1dc2d0bffb76c9bbc0c9e692c72505f3b8dc07f.script [ctx] 10000]
