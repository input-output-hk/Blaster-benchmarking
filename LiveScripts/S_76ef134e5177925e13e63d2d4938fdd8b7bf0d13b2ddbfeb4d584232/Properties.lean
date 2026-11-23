import LiveScripts.Shared
import LiveScripts.S_76ef134e5177925e13e63d2d4938fdd8b7bf0d13b2ddbfeb4d584232.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_76ef134e5177925e13e63d2d4938fdd8b7bf0d13b2ddbfeb4d584232.script [ctx] 10000]
