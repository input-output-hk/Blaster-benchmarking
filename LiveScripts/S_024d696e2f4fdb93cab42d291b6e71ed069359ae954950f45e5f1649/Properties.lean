import LiveScripts.Shared
import LiveScripts.S_024d696e2f4fdb93cab42d291b6e71ed069359ae954950f45e5f1649.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_024d696e2f4fdb93cab42d291b6e71ed069359ae954950f45e5f1649.script [ctx] 10000]
