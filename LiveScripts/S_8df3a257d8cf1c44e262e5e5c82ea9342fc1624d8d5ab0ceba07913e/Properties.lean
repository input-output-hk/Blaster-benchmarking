import LiveScripts.Shared
import LiveScripts.S_8df3a257d8cf1c44e262e5e5c82ea9342fc1624d8d5ab0ceba07913e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8df3a257d8cf1c44e262e5e5c82ea9342fc1624d8d5ab0ceba07913e.script [ctx] 10000]
