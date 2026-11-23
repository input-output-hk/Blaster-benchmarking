import LiveScripts.Shared
import LiveScripts.S_a2f6d5c754614e238d57b1705adb63bfb4618238a286372700d5e227.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a2f6d5c754614e238d57b1705adb63bfb4618238a286372700d5e227.script [redeemer, ctx] 10000]
