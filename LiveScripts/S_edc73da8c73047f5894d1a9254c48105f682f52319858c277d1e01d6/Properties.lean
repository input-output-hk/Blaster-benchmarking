import LiveScripts.Shared
import LiveScripts.S_edc73da8c73047f5894d1a9254c48105f682f52319858c277d1e01d6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_edc73da8c73047f5894d1a9254c48105f682f52319858c277d1e01d6.script [redeemer, ctx] 10000]
