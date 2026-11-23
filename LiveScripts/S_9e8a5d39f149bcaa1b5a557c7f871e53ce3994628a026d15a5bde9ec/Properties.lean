import LiveScripts.Shared
import LiveScripts.S_9e8a5d39f149bcaa1b5a557c7f871e53ce3994628a026d15a5bde9ec.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9e8a5d39f149bcaa1b5a557c7f871e53ce3994628a026d15a5bde9ec.script [datum, redeemer, ctx] 10000]
