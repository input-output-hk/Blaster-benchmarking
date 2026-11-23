import LiveScripts.Shared
import LiveScripts.S_31f92531ac9f1af3079701fab7c66ce997eb07988277ee5b9d640301.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_31f92531ac9f1af3079701fab7c66ce997eb07988277ee5b9d640301.script [redeemer, ctx] 10000]
