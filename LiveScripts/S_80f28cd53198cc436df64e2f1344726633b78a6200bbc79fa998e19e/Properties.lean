import LiveScripts.Shared
import LiveScripts.S_80f28cd53198cc436df64e2f1344726633b78a6200bbc79fa998e19e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_80f28cd53198cc436df64e2f1344726633b78a6200bbc79fa998e19e.script [ctx] 10000]
