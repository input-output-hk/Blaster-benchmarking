import LiveScripts.Shared
import LiveScripts.S_546560234a037d1229f7cd3752e292530a80d8dcd63fd6b6724b2b0b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_546560234a037d1229f7cd3752e292530a80d8dcd63fd6b6724b2b0b.script [ctx] 10000]
