import LiveScripts.Shared
import LiveScripts.S_9fb4b54c367463bd3da3d2e8aa9357133ef7b489adb1cf9cb2e8dd70.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_9fb4b54c367463bd3da3d2e8aa9357133ef7b489adb1cf9cb2e8dd70.script [datum, redeemer, ctx] 10000]
