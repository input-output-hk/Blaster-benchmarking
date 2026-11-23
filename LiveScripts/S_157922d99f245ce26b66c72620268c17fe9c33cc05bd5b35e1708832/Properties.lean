import LiveScripts.Shared
import LiveScripts.S_157922d99f245ce26b66c72620268c17fe9c33cc05bd5b35e1708832.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_157922d99f245ce26b66c72620268c17fe9c33cc05bd5b35e1708832.script [ctx] 10000]
