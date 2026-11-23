import LiveScripts.Shared
import LiveScripts.S_0065c9b47b1aea7b6d94bd1bcdb9a292de7a6b4df1e227702f65156c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0065c9b47b1aea7b6d94bd1bcdb9a292de7a6b4df1e227702f65156c.script [ctx] 10000]
