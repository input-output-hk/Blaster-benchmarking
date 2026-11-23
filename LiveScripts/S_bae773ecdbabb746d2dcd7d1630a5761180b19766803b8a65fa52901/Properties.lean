import LiveScripts.Shared
import LiveScripts.S_bae773ecdbabb746d2dcd7d1630a5761180b19766803b8a65fa52901.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bae773ecdbabb746d2dcd7d1630a5761180b19766803b8a65fa52901.script [ctx] 10000]
