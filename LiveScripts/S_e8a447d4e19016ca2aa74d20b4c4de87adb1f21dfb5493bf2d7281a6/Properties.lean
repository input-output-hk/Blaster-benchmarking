import LiveScripts.Shared
import LiveScripts.S_e8a447d4e19016ca2aa74d20b4c4de87adb1f21dfb5493bf2d7281a6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e8a447d4e19016ca2aa74d20b4c4de87adb1f21dfb5493bf2d7281a6.script [redeemer, ctx] 10000]
