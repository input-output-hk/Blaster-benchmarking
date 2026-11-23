import LiveScripts.Shared
import LiveScripts.S_c3e28c36c3447315ba5a56f33da6a6ddc1770a876a8d9f0cb3a97c4c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c3e28c36c3447315ba5a56f33da6a6ddc1770a876a8d9f0cb3a97c4c.script [datum, redeemer, ctx] 10000]
