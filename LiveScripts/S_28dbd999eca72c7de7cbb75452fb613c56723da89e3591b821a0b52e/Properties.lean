import LiveScripts.Shared
import LiveScripts.S_28dbd999eca72c7de7cbb75452fb613c56723da89e3591b821a0b52e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_28dbd999eca72c7de7cbb75452fb613c56723da89e3591b821a0b52e.script [datum, redeemer, ctx] 10000]
