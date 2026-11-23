import LiveScripts.Shared
import LiveScripts.S_ce8f72aac53cf64f40bc0b54658821b4d5f5393a7321034e63e6fa1c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ce8f72aac53cf64f40bc0b54658821b4d5f5393a7321034e63e6fa1c.script [ctx] 10000]
