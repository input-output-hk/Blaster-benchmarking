import LiveScripts.Shared
import LiveScripts.S_98609fad4c4bea90e4c4fa415032a13e1aba35bacec20da2b62217ae.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_98609fad4c4bea90e4c4fa415032a13e1aba35bacec20da2b62217ae.script [ctx] 10000]
