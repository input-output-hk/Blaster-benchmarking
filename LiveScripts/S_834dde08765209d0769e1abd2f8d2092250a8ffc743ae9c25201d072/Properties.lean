import LiveScripts.Shared
import LiveScripts.S_834dde08765209d0769e1abd2f8d2092250a8ffc743ae9c25201d072.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_834dde08765209d0769e1abd2f8d2092250a8ffc743ae9c25201d072.script [ctx] 10000]
