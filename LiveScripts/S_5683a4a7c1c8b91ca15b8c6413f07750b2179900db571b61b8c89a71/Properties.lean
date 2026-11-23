import LiveScripts.Shared
import LiveScripts.S_5683a4a7c1c8b91ca15b8c6413f07750b2179900db571b61b8c89a71.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5683a4a7c1c8b91ca15b8c6413f07750b2179900db571b61b8c89a71.script [ctx] 10000]
