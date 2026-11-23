import LiveScripts.Shared
import LiveScripts.S_d9143ac63473b17a215d1b7484dfb6ac6b4a0005beb0e26a6ca02c96.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d9143ac63473b17a215d1b7484dfb6ac6b4a0005beb0e26a6ca02c96.script [datum, redeemer, ctx] 10000]
