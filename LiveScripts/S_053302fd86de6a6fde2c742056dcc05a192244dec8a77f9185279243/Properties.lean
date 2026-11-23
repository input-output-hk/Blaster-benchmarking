import LiveScripts.Shared
import LiveScripts.S_053302fd86de6a6fde2c742056dcc05a192244dec8a77f9185279243.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_053302fd86de6a6fde2c742056dcc05a192244dec8a77f9185279243.script [ctx] 10000]
