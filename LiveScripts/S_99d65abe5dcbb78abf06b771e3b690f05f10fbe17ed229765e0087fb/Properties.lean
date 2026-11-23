import LiveScripts.Shared
import LiveScripts.S_99d65abe5dcbb78abf06b771e3b690f05f10fbe17ed229765e0087fb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_99d65abe5dcbb78abf06b771e3b690f05f10fbe17ed229765e0087fb.script [ctx] 10000]
