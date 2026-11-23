import LiveScripts.Shared
import LiveScripts.S_c7977e1e34ef7866b36bf56da97e4138da9c07612532e9d6a80edda9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c7977e1e34ef7866b36bf56da97e4138da9c07612532e9d6a80edda9.script [ctx] 10000]
