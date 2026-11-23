import LiveScripts.Shared
import LiveScripts.S_232ae5ed84c56d470e428788e51ea3cc5d9b6526439ad71909716549.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_232ae5ed84c56d470e428788e51ea3cc5d9b6526439ad71909716549.script [ctx] 10000]
