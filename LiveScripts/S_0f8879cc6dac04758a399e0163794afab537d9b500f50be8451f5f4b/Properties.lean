import LiveScripts.Shared
import LiveScripts.S_0f8879cc6dac04758a399e0163794afab537d9b500f50be8451f5f4b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0f8879cc6dac04758a399e0163794afab537d9b500f50be8451f5f4b.script [datum, redeemer, ctx] 10000]
