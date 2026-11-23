import LiveScripts.Shared
import LiveScripts.S_54f3ff2deabef06aefb04dd2b44b1dfc2ec50e906b3d926dc24fa39c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_54f3ff2deabef06aefb04dd2b44b1dfc2ec50e906b3d926dc24fa39c.script [ctx] 10000]
