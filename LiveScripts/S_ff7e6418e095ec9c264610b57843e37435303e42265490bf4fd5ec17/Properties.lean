import LiveScripts.Shared
import LiveScripts.S_ff7e6418e095ec9c264610b57843e37435303e42265490bf4fd5ec17.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ff7e6418e095ec9c264610b57843e37435303e42265490bf4fd5ec17.script [datum, redeemer, ctx] 10000]
