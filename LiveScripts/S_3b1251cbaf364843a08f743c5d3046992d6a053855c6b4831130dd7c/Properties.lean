import LiveScripts.Shared
import LiveScripts.S_3b1251cbaf364843a08f743c5d3046992d6a053855c6b4831130dd7c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3b1251cbaf364843a08f743c5d3046992d6a053855c6b4831130dd7c.script [ctx] 10000]
