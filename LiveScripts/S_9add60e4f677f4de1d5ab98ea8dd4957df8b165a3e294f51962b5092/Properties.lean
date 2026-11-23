import LiveScripts.Shared
import LiveScripts.S_9add60e4f677f4de1d5ab98ea8dd4957df8b165a3e294f51962b5092.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9add60e4f677f4de1d5ab98ea8dd4957df8b165a3e294f51962b5092.script [datum, redeemer, ctx] 10000]
