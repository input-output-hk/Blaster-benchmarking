import LiveScripts.Shared
import LiveScripts.S_24ac187bf06c913e06d4b5f473283be3420e15190a6e070cc1be346b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_24ac187bf06c913e06d4b5f473283be3420e15190a6e070cc1be346b.script [ctx] 10000]
