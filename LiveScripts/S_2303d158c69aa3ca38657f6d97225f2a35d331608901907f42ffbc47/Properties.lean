import LiveScripts.Shared
import LiveScripts.S_2303d158c69aa3ca38657f6d97225f2a35d331608901907f42ffbc47.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2303d158c69aa3ca38657f6d97225f2a35d331608901907f42ffbc47.script [datum, redeemer, ctx] 10000]
