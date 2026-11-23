import LiveScripts.Shared
import LiveScripts.S_6e23fe172b5b50e2ad59aded9ee8d488f74c7f4686f91b032220adad.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6e23fe172b5b50e2ad59aded9ee8d488f74c7f4686f91b032220adad.script [datum, redeemer, ctx] 10000]
