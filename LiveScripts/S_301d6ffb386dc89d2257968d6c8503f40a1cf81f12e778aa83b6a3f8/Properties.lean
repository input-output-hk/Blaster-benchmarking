import LiveScripts.Shared
import LiveScripts.S_301d6ffb386dc89d2257968d6c8503f40a1cf81f12e778aa83b6a3f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_301d6ffb386dc89d2257968d6c8503f40a1cf81f12e778aa83b6a3f8.script [datum, redeemer, ctx] 10000]
