import LiveScripts.Shared
import LiveScripts.S_5f6bd18abdffc590802e8c765f22a99cfc4b341b7bd446a3d71dc421.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5f6bd18abdffc590802e8c765f22a99cfc4b341b7bd446a3d71dc421.script [ctx] 10000]
