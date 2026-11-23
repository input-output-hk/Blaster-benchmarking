import LiveScripts.Shared
import LiveScripts.S_c76c4bb14a3defa8d30aeb2136d9abb211cef21183c9cbdf0f86f57a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c76c4bb14a3defa8d30aeb2136d9abb211cef21183c9cbdf0f86f57a.script [redeemer, ctx] 10000]
