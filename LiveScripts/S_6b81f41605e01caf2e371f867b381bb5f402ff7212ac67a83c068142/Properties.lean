import LiveScripts.Shared
import LiveScripts.S_6b81f41605e01caf2e371f867b381bb5f402ff7212ac67a83c068142.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_6b81f41605e01caf2e371f867b381bb5f402ff7212ac67a83c068142.script [datum, redeemer, ctx] 10000]
