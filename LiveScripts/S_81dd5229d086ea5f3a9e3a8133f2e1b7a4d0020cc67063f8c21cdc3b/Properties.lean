import LiveScripts.Shared
import LiveScripts.S_81dd5229d086ea5f3a9e3a8133f2e1b7a4d0020cc67063f8c21cdc3b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_81dd5229d086ea5f3a9e3a8133f2e1b7a4d0020cc67063f8c21cdc3b.script [ctx] 10000]
