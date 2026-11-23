import LiveScripts.Shared
import LiveScripts.S_90d5d62facd5295b477e7612d2c91ce6617953cfee4e336cf634ad83.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_90d5d62facd5295b477e7612d2c91ce6617953cfee4e336cf634ad83.script [ctx] 10000]
