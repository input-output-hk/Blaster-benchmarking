import LiveScripts.Shared
import LiveScripts.S_186e32faa80a26810392fda6d559c7ed4721a65ce1c9d4ef3e1c87b4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_186e32faa80a26810392fda6d559c7ed4721a65ce1c9d4ef3e1c87b4.script [ctx] 10000]
