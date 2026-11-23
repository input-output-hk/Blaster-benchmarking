import LiveScripts.Shared
import LiveScripts.S_a895f1885a31ac8915f92914d221839d844b8d9615a7a7c533eed029.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a895f1885a31ac8915f92914d221839d844b8d9615a7a7c533eed029.script [ctx] 10000]
