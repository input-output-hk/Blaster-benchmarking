import LiveScripts.Shared
import LiveScripts.S_7ae70b15af69ac5f452693f9dec0d7bf6ae33fc2ba978695ff73b214.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7ae70b15af69ac5f452693f9dec0d7bf6ae33fc2ba978695ff73b214.script [datum, redeemer, ctx] 10000]
