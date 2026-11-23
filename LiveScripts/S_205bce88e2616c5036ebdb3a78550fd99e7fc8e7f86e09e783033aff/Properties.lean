import LiveScripts.Shared
import LiveScripts.S_205bce88e2616c5036ebdb3a78550fd99e7fc8e7f86e09e783033aff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_205bce88e2616c5036ebdb3a78550fd99e7fc8e7f86e09e783033aff.script [ctx] 10000]
