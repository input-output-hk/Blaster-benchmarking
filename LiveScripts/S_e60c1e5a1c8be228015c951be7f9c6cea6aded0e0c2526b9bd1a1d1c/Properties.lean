import LiveScripts.Shared
import LiveScripts.S_e60c1e5a1c8be228015c951be7f9c6cea6aded0e0c2526b9bd1a1d1c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e60c1e5a1c8be228015c951be7f9c6cea6aded0e0c2526b9bd1a1d1c.script [ctx] 10000]
