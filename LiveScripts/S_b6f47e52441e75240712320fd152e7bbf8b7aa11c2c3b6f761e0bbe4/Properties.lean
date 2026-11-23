import LiveScripts.Shared
import LiveScripts.S_b6f47e52441e75240712320fd152e7bbf8b7aa11c2c3b6f761e0bbe4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b6f47e52441e75240712320fd152e7bbf8b7aa11c2c3b6f761e0bbe4.script [ctx] 10000]
