import LiveScripts.Shared
import LiveScripts.S_6271eefc78c3880752f11c58b2e80bddb25ad92b751e76d3945d68a0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6271eefc78c3880752f11c58b2e80bddb25ad92b751e76d3945d68a0.script [ctx] 10000]
