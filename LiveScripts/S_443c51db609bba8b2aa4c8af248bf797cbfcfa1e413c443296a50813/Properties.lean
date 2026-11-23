import LiveScripts.Shared
import LiveScripts.S_443c51db609bba8b2aa4c8af248bf797cbfcfa1e413c443296a50813.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_443c51db609bba8b2aa4c8af248bf797cbfcfa1e413c443296a50813.script [redeemer, ctx] 10000]
