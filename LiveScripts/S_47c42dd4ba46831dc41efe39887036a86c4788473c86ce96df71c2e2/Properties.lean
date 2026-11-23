import LiveScripts.Shared
import LiveScripts.S_47c42dd4ba46831dc41efe39887036a86c4788473c86ce96df71c2e2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_47c42dd4ba46831dc41efe39887036a86c4788473c86ce96df71c2e2.script [ctx] 10000]
