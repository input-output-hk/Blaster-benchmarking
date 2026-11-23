import LiveScripts.Shared
import LiveScripts.S_6777f0bdceaa201a7d6abcac3ffbdba16cfb1f339eba4cd29003b6c3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6777f0bdceaa201a7d6abcac3ffbdba16cfb1f339eba4cd29003b6c3.script [ctx] 10000]
