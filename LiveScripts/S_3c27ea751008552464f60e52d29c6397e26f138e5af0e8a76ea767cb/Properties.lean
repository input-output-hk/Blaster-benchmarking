import LiveScripts.Shared
import LiveScripts.S_3c27ea751008552464f60e52d29c6397e26f138e5af0e8a76ea767cb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3c27ea751008552464f60e52d29c6397e26f138e5af0e8a76ea767cb.script [ctx] 10000]
