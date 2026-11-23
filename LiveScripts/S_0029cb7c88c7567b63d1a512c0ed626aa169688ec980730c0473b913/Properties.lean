import LiveScripts.Shared
import LiveScripts.S_0029cb7c88c7567b63d1a512c0ed626aa169688ec980730c0473b913.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0029cb7c88c7567b63d1a512c0ed626aa169688ec980730c0473b913.script [redeemer, ctx] 10000]
