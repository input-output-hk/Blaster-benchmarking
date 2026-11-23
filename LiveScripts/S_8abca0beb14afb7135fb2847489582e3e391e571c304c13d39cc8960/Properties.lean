import LiveScripts.Shared
import LiveScripts.S_8abca0beb14afb7135fb2847489582e3e391e571c304c13d39cc8960.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_8abca0beb14afb7135fb2847489582e3e391e571c304c13d39cc8960.script [ctx] 10000]
