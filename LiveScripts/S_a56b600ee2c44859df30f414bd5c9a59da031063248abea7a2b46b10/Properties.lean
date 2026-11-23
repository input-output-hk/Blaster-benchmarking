import LiveScripts.Shared
import LiveScripts.S_a56b600ee2c44859df30f414bd5c9a59da031063248abea7a2b46b10.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a56b600ee2c44859df30f414bd5c9a59da031063248abea7a2b46b10.script [datum, redeemer, ctx] 10000]
