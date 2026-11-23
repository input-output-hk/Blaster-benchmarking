import LiveScripts.Shared
import LiveScripts.S_5ef84dc88c7821e03113f944982bbb9df14f73f7f5c1aa3321c6244d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5ef84dc88c7821e03113f944982bbb9df14f73f7f5c1aa3321c6244d.script [ctx] 10000]
