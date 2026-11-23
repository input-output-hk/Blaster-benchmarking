import LiveScripts.Shared
import LiveScripts.S_4929def420371358a3f8954e654d0b384517d7ded4497fbf70919867.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4929def420371358a3f8954e654d0b384517d7ded4497fbf70919867.script [ctx] 10000]
