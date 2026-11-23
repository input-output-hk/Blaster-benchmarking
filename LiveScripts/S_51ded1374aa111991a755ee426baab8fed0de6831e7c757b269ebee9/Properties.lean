import LiveScripts.Shared
import LiveScripts.S_51ded1374aa111991a755ee426baab8fed0de6831e7c757b269ebee9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_51ded1374aa111991a755ee426baab8fed0de6831e7c757b269ebee9.script [datum, redeemer, ctx] 10000]
