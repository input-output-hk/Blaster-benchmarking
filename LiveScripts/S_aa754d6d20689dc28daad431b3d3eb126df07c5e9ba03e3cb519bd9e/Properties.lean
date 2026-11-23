import LiveScripts.Shared
import LiveScripts.S_aa754d6d20689dc28daad431b3d3eb126df07c5e9ba03e3cb519bd9e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_aa754d6d20689dc28daad431b3d3eb126df07c5e9ba03e3cb519bd9e.script [ctx] 10000]
