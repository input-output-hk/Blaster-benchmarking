import LiveScripts.Shared
import LiveScripts.S_7df49f14cee1bca6c035cb357c47cb4ee002e8fd0245b11ff88fef96.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_7df49f14cee1bca6c035cb357c47cb4ee002e8fd0245b11ff88fef96.script [ctx] 10000]
