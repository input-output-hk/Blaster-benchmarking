import LiveScripts.Shared
import LiveScripts.S_47fe99d0374e41ba03cade81ef4702ed6a7c4254892f48223179343b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_47fe99d0374e41ba03cade81ef4702ed6a7c4254892f48223179343b.script [ctx] 10000]
