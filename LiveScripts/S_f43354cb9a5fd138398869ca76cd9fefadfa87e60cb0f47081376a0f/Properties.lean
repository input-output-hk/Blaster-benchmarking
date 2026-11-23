import LiveScripts.Shared
import LiveScripts.S_f43354cb9a5fd138398869ca76cd9fefadfa87e60cb0f47081376a0f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f43354cb9a5fd138398869ca76cd9fefadfa87e60cb0f47081376a0f.script [ctx] 10000]
