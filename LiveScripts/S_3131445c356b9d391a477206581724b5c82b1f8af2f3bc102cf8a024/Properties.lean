import LiveScripts.Shared
import LiveScripts.S_3131445c356b9d391a477206581724b5c82b1f8af2f3bc102cf8a024.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_3131445c356b9d391a477206581724b5c82b1f8af2f3bc102cf8a024.script [ctx] 10000]
