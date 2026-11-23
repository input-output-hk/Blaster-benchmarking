import LiveScripts.Shared
import LiveScripts.S_1c212131a84adb4791a11f5b3835aa4758e21ee4f14bd69f8e80abc2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1c212131a84adb4791a11f5b3835aa4758e21ee4f14bd69f8e80abc2.script [redeemer, ctx] 10000]
