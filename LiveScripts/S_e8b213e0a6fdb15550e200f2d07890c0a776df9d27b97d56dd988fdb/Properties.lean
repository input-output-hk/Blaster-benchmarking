import LiveScripts.Shared
import LiveScripts.S_e8b213e0a6fdb15550e200f2d07890c0a776df9d27b97d56dd988fdb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e8b213e0a6fdb15550e200f2d07890c0a776df9d27b97d56dd988fdb.script [ctx] 10000]
