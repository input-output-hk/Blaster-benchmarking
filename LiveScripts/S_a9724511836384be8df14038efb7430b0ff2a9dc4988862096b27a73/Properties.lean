import LiveScripts.Shared
import LiveScripts.S_a9724511836384be8df14038efb7430b0ff2a9dc4988862096b27a73.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a9724511836384be8df14038efb7430b0ff2a9dc4988862096b27a73.script [ctx] 10000]
