import LiveScripts.Shared
import LiveScripts.S_8d258b9d08dcab73f3165a11751d464b46056264091c1789da588726.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8d258b9d08dcab73f3165a11751d464b46056264091c1789da588726.script [datum, redeemer, ctx] 10000]
