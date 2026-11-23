import LiveScripts.Shared
import LiveScripts.S_e7d97fde3e0a49a16eb8bae7e21dc7e9709bd85574d801089125aae6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e7d97fde3e0a49a16eb8bae7e21dc7e9709bd85574d801089125aae6.script [ctx] 10000]
