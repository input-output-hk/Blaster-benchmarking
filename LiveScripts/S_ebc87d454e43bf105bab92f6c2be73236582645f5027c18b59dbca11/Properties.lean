import LiveScripts.Shared
import LiveScripts.S_ebc87d454e43bf105bab92f6c2be73236582645f5027c18b59dbca11.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ebc87d454e43bf105bab92f6c2be73236582645f5027c18b59dbca11.script [ctx] 10000]
