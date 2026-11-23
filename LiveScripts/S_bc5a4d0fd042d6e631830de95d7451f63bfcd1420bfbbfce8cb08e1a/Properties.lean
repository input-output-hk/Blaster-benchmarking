import LiveScripts.Shared
import LiveScripts.S_bc5a4d0fd042d6e631830de95d7451f63bfcd1420bfbbfce8cb08e1a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_bc5a4d0fd042d6e631830de95d7451f63bfcd1420bfbbfce8cb08e1a.script [datum, redeemer, ctx] 10000]
